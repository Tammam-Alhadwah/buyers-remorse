// ===========================================================================
// expenses_list_screen.dart  -  FR8: the list of all expenses (the READ part
// of CRUD) and the entry point to add / view / edit / delete one.
//
// The screen does NOT own the list and never touches the database. It reads
// ExpenseProvider and redraws whenever the provider says the data changed -
// which happens after every add, edit and delete, wherever in the app they
// were made. That is why there is no "reload after coming back" code here
// any more: the provider has already told us.
//
// Three states, three bodies: spinner while loading, an error view with
// "Try again", or the list (with a friendly screen when it is empty).
//
// Searching and filtering (FR16-FR20) live in their own screen, opened from
// the magnifier in the app bar.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../providers/expense_provider.dart';
import '../utils/constants.dart';
import '../widgets/app_drawer.dart';
import '../widgets/expense_card.dart';
import 'add_expense_screen.dart';
import 'expense_details_screen.dart';
import 'search_expenses_screen.dart';

class ExpensesListScreen extends StatefulWidget {
  // Needed only so this screen can show the same side menu as the dashboard.
  final User user;

  const ExpensesListScreen({super.key, required this.user});

  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  // ExpenseProvider() always returns the one shared object (it is a
  // singleton), so this is the same provider the dashboard listens to.
  final ExpenseProvider provider = ExpenseProvider();

  @override
  void initState() {
    super.initState();

    // Safe to call straight from initState: the provider defers its first
    // notification to a microtask, so nothing is asked to redraw while this
    // screen is still being built.
    provider.loadExpenses();
  }

  void openScreen(Widget screen) {
    // No reload afterwards: whatever that screen changes, it changes through
    // the provider, and the provider redraws us.
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          // FR16-FR20 live one tap away, where people look for them.
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search and filter',
            onPressed: () => openScreen(SearchExpensesScreen(user: widget.user)),
          ),
          const LogoutAction(),
        ],
      ),
      drawer: AppDrawer(user: widget.user),

      // FR5 starts here: the "+" button in the corner.
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => openScreen(const AddExpenseScreen()),
        backgroundColor: kExpenseColor,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),

      // ListenableBuilder rebuilds ONLY what is inside it, every time the
      // provider calls notifyListeners(). The app bar and the button above
      // are built once and left alone.
      body: ListenableBuilder(
        listenable: provider,
        builder: (context, _) => buildBody(),
      ),
    );
  }

  // Splitting the body into its own method keeps build() readable: one look
  // tells you which of the three states the screen is in.
  Widget buildBody() {
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                provider.errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: provider.loadExpenses,
                  child: const Text('Try again'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final expenses = provider.expenses;

    if (expenses.isEmpty) {
      // An empty list should explain itself instead of showing a blank page.
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.receipt_long, size: 72, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'No expenses yet',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Tap "Add" to record your first expense.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    // RefreshIndicator = pull the list down to reload it.
    return RefreshIndicator(
      onRefresh: provider.loadExpenses,
      child: ListView.builder(
        // .builder only builds the rows that are visible, so a list of a
        // thousand expenses still scrolls smoothly.
        padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 90),
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final expense = expenses[index];
          return ExpenseCard(
            expense: expense,
            // FR9: tap a row to see everything about it.
            onTap: () => openScreen(ExpenseDetailsScreen(expense: expense)),
          );
        },
      ),
    );
  }
}