// ===========================================================================
// add_expense_screen.dart  -  FR5: add a new expense (CREATE).
//
// Notice how short this file is. All the fields, rules and the date picker
// live in widgets/expense_form.dart; this screen only says what "Save" does:
// hand the expense to the provider and close.
//
// It talks to ExpenseProvider, not to DatabaseHelper. The provider writes the
// row AND refreshes its list, so the expenses list, the dashboard and the
// reports are all correct the moment this screen closes.
// ===========================================================================

import 'package:flutter/material.dart';

import '../providers/expense_provider.dart';
import '../widgets/expense_form.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body: ExpenseForm(
        submitLabel: 'ADD EXPENSE',
        onSave: (expense) async {
          await ExpenseProvider().addExpense(expense);

          // context.mounted: the screen may have been closed while the
          // database was writing. Using a dead context crashes the app.
          if (!context.mounted) return;

          Navigator.pop(context, true);
        },
      ),
    );
  }
}