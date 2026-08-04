// ===========================================================================
// edit_expense_screen.dart  -  FR6: edit an existing expense (UPDATE).
//
// The twin of add_expense_screen.dart. Same form, two differences:
//   - it receives the expense to edit and passes it to the form as `initial`,
//     so every field starts filled in
//   - "Save" calls updateExpense() instead of addExpense()
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/expense.dart';
import '../providers/expense_provider.dart';
import '../widgets/expense_form.dart';

class EditExpenseScreen extends StatelessWidget {
  final Expense expense;

  const EditExpenseScreen({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Expense')),
      body: ExpenseForm(
        initial: expense, // <- the only real difference
        submitLabel: 'SAVE CHANGES',
        onSave: (updated) async {
          // false = 0 rows changed, which means the expense was deleted from
          // another screen while this one was open.
          final saved = await ExpenseProvider().updateExpense(updated);
          if (!context.mounted) return;

          if (!saved) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('This expense no longer exists')),
            );
            return;
          }

          Navigator.pop(context, true);
        },
      ),
    );
  }
}