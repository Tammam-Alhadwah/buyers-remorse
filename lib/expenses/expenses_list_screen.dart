// ===========================================================================
// expenses_list_screen.dart  -  FR8: the list of all expenses (the READ part
// of CRUD) and the entry point to add / view / edit / delete one.
//
// The screen owns three pieces of state and shows a different body for each:
//   isLoading  -> a spinner
//   error      -> a message with a "Try again" button
//   expenses   -> the list, or a friendly "nothing yet" screen when empty
//
// Searching and filtering (FR16-FR20) belong to their own task and are not
// here yet.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/expense.dart';
import '../database/database_helper.dart';
import '../utils/constants.dart';
import '../widgets/app_drawer.dart';
import '../widgets/expense_card.dart';
import 'add_expense_screen.dart';
import 'expense_details_screen.dart';

class ExpensesListScreen extends StatefulWidget {
  // Needed only so this screen can show the same side menu as the dashboard.
  final User user;

  const ExpensesListScreen({super.key, required this.user});

  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  List<Expense> expenses = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    // initState cannot be async, so we start the work and let it finish on
    // its own. The screen shows the spinner until it does.
    loadExpenses();
  }

  Future<void> loadExpenses() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final rows = await DatabaseHelper().getAllExpenses();
      if (!mounted) return;
      setState(() {
        expenses = rows;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Could not load your expenses.';
        isLoading = false;
      });
    }
  }

  // Opens a screen and reloads the list afterwards. Every screen we push can
  // change the data (add, edit, delete), and reading a local database again
  // is cheap - much safer than trying to patch the list by hand.
  Future<void> openAndReload(Widget screen) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
    if (!mounted) return;
    await loadExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expenses')),
      drawer: AppDrawer(user: widget.user),

      // FR5 starts here: the "+" button in the corner.
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => openAndReload(const AddExpenseScreen()),
        backgroundColor: kExpenseColor,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),

      body: buildBody(),
    );
  }

  // Splitting the body into its own method keeps build() readable: one look
  // tells you which of the three states the screen is in.
  Widget buildBody() {
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
                  onPressed: loadExpenses,
                  child: const Text('Try again'),
                ),
              ),
            ],
          ),
        ),
      );
    }

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
      onRefresh: loadExpenses,
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
            onTap: () => openAndReload(
              ExpenseDetailsScreen(expense: expense),
            ),
          );
        },
      ),
    );
  }
}
