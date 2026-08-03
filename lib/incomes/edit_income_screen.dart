// ===========================================================================
// edit_income_screen.dart  -  FR11: change the value (or any other field) of
// an existing income (UPDATE).
//
// The twin of add_income_screen.dart. Two differences: it receives the income
// and hands it to the form as `initial` so the fields start filled in, and
// "Save" calls updateIncome() instead of addIncome().
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/income.dart';
import '../database/database_helper.dart';
import '../widgets/income_form.dart';

class EditIncomeScreen extends StatelessWidget {
  final Income income;

  const EditIncomeScreen({super.key, required this.income});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Income')),
      body: IncomeForm(
        initial: income, // <- the only real difference
        submitLabel: 'SAVE CHANGES',
        onSave: (updated) async {
          final changed = await DatabaseHelper().updateIncome(updated);
          if (!context.mounted) return;

          if (changed == 0) {
            // 0 rows changed = the income was deleted from another screen.
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('This income no longer exists')),
            );
            return;
          }

          Navigator.pop(context, true); // true = reload the list
        },
      ),
    );
  }
}
