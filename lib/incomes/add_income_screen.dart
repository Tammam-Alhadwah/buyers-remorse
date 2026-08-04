// ===========================================================================
// add_income_screen.dart  -  FR10: record a salary or any other income
// (CREATE).
//
// Short on purpose: the fields and the rules live in widgets/income_form.dart.
// This screen only says what "Save" does - hand the income to the provider
// and close. The provider stores it and refreshes every screen showing income.
// ===========================================================================

import 'package:flutter/material.dart';

import '../providers/income_provider.dart';
import '../widgets/income_form.dart';

class AddIncomeScreen extends StatelessWidget {
  const AddIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Income')),
      body: IncomeForm(
        submitLabel: 'ADD INCOME',
        onSave: (income) async {
          await IncomeProvider().addIncome(income);

          // context.mounted: the screen may have been closed while the
          // database was writing. Using a dead context crashes the app.
          if (!context.mounted) return;

          Navigator.pop(context, true);
        },
      ),
    );
  }
}