// ===========================================================================
// search_expenses_screen.dart  -  the search and filter module.
//
//    FR16 search by name        FR17 search by date
//    FR18 search by category    FR19 search by amount (more than / less than)
//    FR20 combined search       (several conditions at once)
//
// HOW IT WORKS
// The screen collects whatever the user filled in and hands it to ONE
// function, ExpenseProvider.search(). Anything left empty is sent as null,
// which means "do not filter on this". So the five requirements are not five
// separate searches - they are the same search with more or fewer conditions.
//
// The filtering is done by SQLite in the WHERE clause, NOT by loading every
// expense and dropping the ones that do not match in Dart. That is the whole
// point of using a database.
//
// WHY THE RESULTS ARE HELD HERE AND NOT IN THE PROVIDER
// The provider owns the list every screen shares. A search result is not
// that: it is a private answer to a question this screen just asked, and it
// belongs to this screen only. So search() returns the rows instead of
// replacing the shared list.
// ===========================================================================

import 'dart:async';

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/expense.dart';
import '../models/category.dart';
import '../database/database_helper.dart';
import '../providers/expense_provider.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../utils/date_ranges.dart';
import '../widgets/app_drawer.dart';
import '../widgets/expense_card.dart';
import 'expense_details_screen.dart';

class SearchExpensesScreen extends StatefulWidget {
  final User user;

  const SearchExpensesScreen({super.key, required this.user});

  @override
  State<SearchExpensesScreen> createState() => _SearchExpensesScreenState();
}

class _SearchExpensesScreenState extends State<SearchExpensesScreen> {
  final ExpenseProvider provider = ExpenseProvider();

  // The category dropdown is the only thing this screen reads straight from
  // the database: categories are not one of the two lists the providers own.
  final DatabaseHelper _db = DatabaseHelper();

  // ---- the filters ----
  final titleController = TextEditingController(); // FR16
  final minController = TextEditingController(); // FR19
  final maxController = TextEditingController(); // FR19
  DateRange? dateRange; // FR17
  int? categoryId; // FR18

  // ---- the data ----
  List<Category> categories = [];
  List<Expense> results = [];
  bool isLoading = true;
  String? errorMessage;
  bool filtersOpen = true;

  // Typing "coffee" fires six changes. Without this timer we would send six
  // queries and the answers could even arrive out of order. Instead we wait
  // until the user has stopped typing for a moment, then search once.
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    loadCategories();
    runSearch(); // no filters yet -> shows everything
  }

  @override
  void dispose() {
    // Controllers and timers hold memory and keep running after the screen is
    // gone. Releasing them here is not optional.
    _debounce?.cancel();
    titleController.dispose();
    minController.dispose();
    maxController.dispose();
    super.dispose();
  }

  Future<void> loadCategories() async {
    try {
      final rows = await _db.getAllCategories();
      if (!mounted) return;
      setState(() => categories = rows);
    } catch (e) {
      // A failed category list must not break the whole screen: the user can
      // still search by name, date and amount.
      if (!mounted) return;
      setState(() => categories = []);
    }
  }

  // -------------------------------------------------------------------------
  // THE SEARCH ITSELF
  // -------------------------------------------------------------------------
  Future<void> runSearch() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final rows = await provider.search(
        text: titleController.text, // FR16
        range: dateRange, // FR17
        categoryId: categoryId, // FR18
        // tryParse returns null when the box is empty or holds nonsense, and
        // null is exactly what "no amount filter" means - so a half-typed
        // number simply does not filter instead of crashing.
        minAmount: double.tryParse(minController.text.trim()), // FR19
        maxAmount: double.tryParse(maxController.text.trim()), // FR19
      );

      if (!mounted) return;
      setState(() {
        results = rows;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Could not run the search.';
        isLoading = false;
      });
    }
  }

  // Called on every keystroke. It only starts the search once the typing has
  // paused for 350 milliseconds.
  void onTextChanged() {
    // Redraw now so the clear button and the filter badge react to the very
    // first letter; the search itself still waits for the pause.
    setState(() {});
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), runSearch);
  }

  // FR17: let the user pick two dates. showDateRangePicker is the built-in
  // Flutter calendar for a start and an end day.
  Future<void> pickDateRange() async {
    final firstDate = DateTime(2000);
    final lastDate = dateOnly(DateTime.now());

    // THE BUG THIS GUARD FIXES
    // showDateRangePicker refuses to open if the range it starts with reaches
    // outside firstDate..lastDate - in debug it throws an assertion, so the
    // button looks dead. "This month" runs to the 31st while lastDate is
    // today, which is exactly that case. So we trim the starting range to
    // what the picker allows, and pass nothing at all if trimming leaves an
    // impossible range.
    DateTimeRange? initialRange;
    final current = dateRange;
    if (current != null) {
      final start = current.start.isBefore(firstDate) ? firstDate : current.start;
      final end = current.end.isAfter(lastDate) ? lastDate : current.end;
      if (!end.isBefore(start)) {
        initialRange = DateTimeRange(start: start, end: end);
      }
    }

    final picked = await showDateRangePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDateRange: initialRange,
      helpText: 'Expenses between',
    );

    if (picked == null || !mounted) return;
    setState(() => dateRange = DateRange(picked.start, picked.end));
    runSearch();
  }

  // Quick buttons for the ranges people actually ask for.
  void useQuickRange(DateRange? value) {
    setState(() => dateRange = value);
    runSearch();
  }

  void clearFilters() {
    setState(() {
      titleController.clear();
      minController.clear();
      maxController.clear();
      dateRange = null;
      categoryId = null;
    });
    runSearch();
  }

  // How many conditions are switched on. Shown as a badge so the user always
  // knows the list is filtered, even with the panel collapsed.
  int get activeFilterCount {
    var count = 0;
    if (titleController.text.trim().isNotEmpty) count++;
    if (dateRange != null) count++;
    if (categoryId != null) count++;
    if (double.tryParse(minController.text.trim()) != null) count++;
    if (double.tryParse(maxController.text.trim()) != null) count++;
    return count;
  }

  // The sum of what is on screen. Useful on its own: "how much did I spend on
  // food in July?" is a search plus a total.
  double get resultsTotal {
    return results.fold<double>(0, (sum, expense) => sum + expense.amount);
  }

  // -------------------------------------------------------------------------
  // DRAWING
  // -------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search expenses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_off),
            tooltip: 'Clear filters',
            onPressed: activeFilterCount == 0 ? null : clearFilters,
          ),
          const LogoutAction(),
        ],
      ),
      drawer: AppDrawer(user: widget.user),
      body: Column(
        children: [
          buildFilterPanel(),
          const Divider(height: 1),
          buildResultsHeader(),
          Expanded(child: buildResults()),
        ],
      ),
    );
  }

  Widget buildFilterPanel() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // FR16: the name box is always visible - it is the one people use
          // most. The rest of the filters hide behind the arrow.
          Padding(
            padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: titleController,
                    onChanged: (_) => onTextChanged(),
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: 'Search by name',
                      prefixIcon: const Icon(Icons.search),
                      isDense: true,
                      suffixIcon: titleController.text.isEmpty
                          ? null
                          : IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          titleController.clear();
                          runSearch();
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                  tooltip: filtersOpen ? 'Hide filters' : 'More filters',
                  icon: Badge(
                    // The badge is hidden when nothing is filtered, so it only
                    // appears when it carries information.
                    isLabelVisible: activeFilterCount > 0,
                    label: Text('$activeFilterCount'),
                    child: Icon(
                      filtersOpen ? Icons.expand_less : Icons.tune,
                    ),
                  ),
                  onPressed: () => setState(() => filtersOpen = !filtersOpen),
                ),
              ],
            ),
          ),

          if (filtersOpen)
            Padding(
              padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---- FR18: by category ----
                  DropdownButtonFormField<int?>(
                    initialValue: categoryId,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      isDense: true,
                    ),
                    items: [
                      // A null value is a real choice here: "all categories".
                      const DropdownMenuItem<int?>(
                        value: null,
                        child: Text('All categories'),
                      ),
                      ...categories.map(
                            (category) => DropdownMenuItem<int?>(
                          value: category.id,
                          child: Text(category.name),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() => categoryId = value);
                      runSearch();
                    },
                  ),
                  const SizedBox(height: 12),

                  // ---- FR19: by amount ----
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: minController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onChanged: (_) => onTextChanged(),
                          decoration: const InputDecoration(
                            labelText: 'More than',
                            isDense: true,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: maxController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onChanged: (_) => onTextChanged(),
                          decoration: const InputDecoration(
                            labelText: 'Less than',
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // ---- FR17: by date ----
                  const Text('Date', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      quickChip('Any time', dateRange == null, () {
                        useQuickRange(null);
                      }),
                      quickChip(
                        'Today',
                        isSameRange(DateRange.day(DateTime.now())),
                            () => useQuickRange(DateRange.day(DateTime.now())),
                      ),
                      quickChip(
                        'This week',
                        isSameRange(DateRange.week(DateTime.now())),
                            () => useQuickRange(DateRange.week(DateTime.now())),
                      ),
                      quickChip(
                        'This month',
                        isSameRange(DateRange.month(DateTime.now())),
                            () => useQuickRange(DateRange.month(DateTime.now())),
                      ),
                      ActionChip(
                        avatar: const Icon(Icons.date_range, size: 18),
                        label: const Text('Pick dates'),
                        onPressed: pickDateRange,
                      ),
                    ],
                  ),
                  if (dateRange != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Showing ${dateRange!.label}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // Small helper so the four date chips are written once.
  Widget quickChip(String label, bool selected, VoidCallback onTap) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      showCheckmark: false,
      selectedColor: kPrimaryColor,
      labelStyle: TextStyle(
        color: selected ? Colors.white : Colors.black87,
        fontSize: 13,
      ),
      onSelected: (_) => onTap(),
    );
  }

  // Is the chosen range the same as this preset? Compared by both ends,
  // because "this week" and "this month" can start on the same day.
  bool isSameRange(DateRange other) {
    final current = dateRange;
    if (current == null) return false;
    return current.start == other.start && current.end == other.end;
  }

  // FR20 in one line: how many rows matched, and what they add up to.
  Widget buildResultsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              isLoading
                  ? 'Searching...'
                  : '${results.length} ${results.length == 1 ? 'expense' : 'expenses'}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          if (!isLoading && results.isNotEmpty)
            Text(
              'Total: ${formatAmount(resultsTotal)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: kExpenseColor,
              ),
            ),
        ],
      ),
    );
  }

  Widget buildResults() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: runSearch,
                  child: const Text('Try again'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (results.isEmpty) {
      // An empty result is not an error: it means the filters are too narrow.
      // The message says what to do about it.
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.search_off, size: 72, color: Colors.grey),
              const SizedBox(height: 16),
              const Text(
                'No expense matches',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Try a shorter word, a wider date range, or remove a filter.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              if (activeFilterCount > 0) ...[
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: clearFilters,
                    child: const Text('Clear all filters'),
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(kPadding, 8, kPadding, kPadding),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final expense = results[index];
        return ExpenseCard(
          expense: expense,
          // The details screen can edit or delete the row, so we search again
          // when we come back: a renamed expense may no longer match.
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ExpenseDetailsScreen(expense: expense),
              ),
            );
            if (!mounted) return;
            await runSearch();
          },
        );
      },
    );
  }
}