// ===========================================================================
// add_expense_screen.dart  -  FR5: add a new expense (CREATE).
//
// Notice how short this file is. All the fields, rules and the date picker
// live in widgets/expense_form.dart; this screen only says what "Save" does:
// insert the expense and close.
// ===========================================================================

import 'package:flutter/material.dart';

import '../database/database_helper.dart';
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
          await DatabaseHelper().addExpense(expense);

          // context.mounted: the screen may have been closed while the
          // database was writing. Using a dead context crashes the app.
          if (!context.mounted) return;

          // true = "something changed", so the list behind us reloads.
          Navigator.pop(context, true);
        },
      ),
    );
  }
}
