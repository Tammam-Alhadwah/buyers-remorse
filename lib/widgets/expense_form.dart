// ===========================================================================
// expense_form.dart  -  the input form used by BOTH "Add expense" and
// "Edit expense".
//
// WHY ONE WIDGET FOR TWO SCREENS?
// The two screens ask for exactly the same five values. If each screen had
// its own copy of the form, every future change (a new field, a new rule)
// would have to be made twice - and one day it would be made only once.
// Here the form is written once; the screens only decide what "Save" does.
//
//   Add screen  -> ExpenseForm(onSave: (e) => addExpense(e))
//   Edit screen -> ExpenseForm(initial: expense, onSave: (e) => updateExpense(e))
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // input formatters

import '../models/category.dart';
import '../models/expense.dart';
import '../database/database_helper.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../utils/validators.dart';
import '../utils/category_style.dart';

class ExpenseForm extends StatefulWidget {
  // null  -> we are creating a new expense
  // not null -> we are editing this one, so the fields start filled in
  final Expense? initial;

  // What the screen wants to do with the finished expense. It returns a
  // Future because saving touches the database, and the form waits for it
  // before turning the spinner off.
  final Future<void> Function(Expense expense) onSave;

  final String submitLabel;

  const ExpenseForm({
    super.key,
    this.initial,
    required this.onSave,
    this.submitLabel = 'SAVE',
  });

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController titleController;
  late final TextEditingController amountController;
  late final TextEditingController notesController;

  // The date and the category are not typed, so they are plain state
  // variables instead of controllers.
  late DateTime selectedDate;
  int? selectedCategoryId;

  List<Category> categories = [];
  bool isLoadingCategories = true;
  bool isSaving = false;
  String? loadError;

  @override
  void initState() {
    super.initState();

    final initial = widget.initial;

    // Fill the fields from the expense we are editing, or start empty.
    titleController = TextEditingController(text: initial?.title ?? '');
    amountController = TextEditingController(
      // toStringAsFixed(2) shows 20 as "20.00", which is what the user
      // expects to see in a money field.
      text: initial == null ? '' : initial.amount.toStringAsFixed(2),
    );
    notesController = TextEditingController(text: initial?.notes ?? '');

    selectedDate = initial?.expenseDate ?? dateOnly(DateTime.now());
    selectedCategoryId = initial?.categoryId;

    loadCategories();
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    notesController.dispose();
    super.dispose();
  }

  // The dropdown cannot be built before we know the categories, so we fetch
  // them once when the form opens.
  Future<void> loadCategories() async {
    try {
      final result = await DatabaseHelper().getAllCategories();
      if (!mounted) return;

      setState(() {
        categories = result;

        // Safety net: if the expense points at a category that was deleted,
        // the dropdown would be given a value that is not in its item list,
        // and Flutter throws. Clearing it forces the user to pick again.
        final ids = result.map((c) => c.id).toSet();
        if (!ids.contains(selectedCategoryId)) selectedCategoryId = null;

        isLoadingCategories = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        loadError = 'Could not load the categories.';
        isLoadingCategories = false;
      });
    }
  }

  void _showMessage(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? kExpenseColor : kIncomeColor,
      ),
    );
  }

  // Opens the calendar. firstDate/lastDate make an invalid date impossible to
  // even tap - the friendliest kind of validation.
  Future<void> pickDate() async {
    final today = dateOnly(DateTime.now());

    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.isAfter(today) ? today : selectedDate,
      firstDate: DateTime(2000),
      lastDate: today, // no future expenses
    );

    if (picked == null) return; // the user pressed Cancel
    setState(() => selectedDate = dateOnly(picked));
  }

  Future<void> save() async {
    // 1. the typed fields
    if (!_formKey.currentState!.validate()) return;

    // 2. the fields a Form cannot check by itself
    final dateError = Validators.pastOrToday(selectedDate);
    if (dateError != null) {
      _showMessage(dateError);
      return;
    }
    if (selectedCategoryId == null) {
      _showMessage('Please choose a category');
      return;
    }

    // 3. build the object. The text is cleaned before it is stored.
    final expense = Expense(
      id: widget.initial?.id, // null when adding, real id when editing
      title: Validators.sanitize(titleController.text),
      amount: double.parse(amountController.text.trim()),
      expenseDate: selectedDate,
      categoryId: selectedCategoryId,
      notes: Validators.sanitize(notesController.text),
    );

    setState(() => isSaving = true);
    try {
      await widget.onSave(expense); // the screen decides: insert or update
    } catch (e) {
      if (!mounted) return;
      _showMessage('Could not save. Please try again.');
    } finally {
      // The screen usually closes itself after a successful save, so this
      // only matters when something went wrong.
      if (mounted) setState(() => isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoadingCategories) {
      return const Center(child: CircularProgressIndicator());
    }

    if (loadError != null) {
      return _MessageView(
        icon: Icons.error_outline,
        message: loadError!,
        actionLabel: 'Try again',
        onAction: () {
          setState(() {
            loadError = null;
            isLoadingCategories = true;
          });
          loadCategories();
        },
      );
    }

    if (categories.isEmpty) {
      // The database seeds categories, so this only happens if the user
      // deleted them all. Saving would break the foreign key, so we stop here
      // with an explanation instead of showing a form that cannot be saved.
      return const _MessageView(
        icon: Icons.category_outlined,
        message: 'There are no categories yet.\n'
            'Add one from the Categories screen first.',
      );
    }

    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(kPadding),
        children: [
          // ---- TITLE ----
          TextFormField(
            controller: titleController,
            enabled: !isSaving,
            textCapitalization: TextCapitalization.sentences,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Title',
              prefixIcon: Icon(Icons.title),
              hintText: 'Lunch, taxi, electricity bill...',
            ),
            validator: Validators.title,
          ),

          const SizedBox(height: 16),

          // ---- AMOUNT ----
          TextFormField(
            controller: amountController,
            enabled: !isSaving,
            // decimal: true gives the phone keyboard a dot key.
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            // The formatter blocks letters and signs while typing, so a
            // negative amount can never even be entered.
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            ],
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Amount',
              prefixIcon: Icon(Icons.payments),
              hintText: '0.00',
            ),
            validator: Validators.amount,
          ),

          const SizedBox(height: 16),

          // ---- DATE ----
          // A read-only tile instead of a text field: the user can only pick
          // a real date from the calendar, never type "32/13/2026".
          InkWell(
            onTap: isSaving ? null : pickDate,
            borderRadius: BorderRadius.circular(4),
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Date',
                prefixIcon: Icon(Icons.calendar_today),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatDate(selectedDate)),
                  const Icon(Icons.arrow_drop_down, color: Colors.grey),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ---- CATEGORY ----
          DropdownButtonFormField<int>(
            initialValue: selectedCategoryId,
            isExpanded: true, // long names get ellipsis instead of overflow
            decoration: const InputDecoration(
              labelText: 'Category',
              prefixIcon: Icon(Icons.category),
            ),
            items: categories.map((category) {
              final color = categoryColor(category.color);
              return DropdownMenuItem<int>(
                value: category.id,
                child: Row(
                  children: [
                    Icon(categoryIcon(category.icon), color: color, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        category.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: isSaving
                ? null
                : (value) => setState(() => selectedCategoryId = value),
            validator: (value) =>
                value == null ? 'Please choose a category' : null,
          ),

          const SizedBox(height: 16),

          // ---- NOTES (optional) ----
          TextFormField(
            controller: notesController,
            enabled: !isSaving,
            maxLines: 3,
            maxLength: 200,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Notes (optional)',
              alignLabelWithHint: true,
            ),
            validator: Validators.notes,
          ),

          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: isSaving ? null : save,
            child: isSaving
                ? const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    widget.submitLabel,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// A small private widget for the two "nothing to show" states above.
// The underscore keeps it private to this file: it is a detail of the form,
// not something other files should use.
// ---------------------------------------------------------------------------
class _MessageView extends StatelessWidget {
  final IconData icon;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  const _MessageView({
    required this.icon,
    required this.message,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(kPadding * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 20),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: onAction,
                  child: Text(actionLabel!),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
