// ===========================================================================
// expense_card.dart  -  a reusable card that shows ONE expense in a list.
//
// STUB for a later task. A "widget" file holds a small UI piece you reuse in
// many places, so you don't copy-paste the same layout. Pass an Expense in,
// get a nice card out.
// ===========================================================================

import 'package:flutter/material.dart';
// import '../models/expense.dart'; // uncomment when you build this

class ExpenseCard extends StatelessWidget {
  // Later this will take an Expense:  final Expense expense;
  const ExpenseCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder card. Replace with the real expense layout later:
    // title on the left, amount on the right, category icon, etc.
    return const Card(
      child: ListTile(
        leading: Icon(Icons.receipt_long),
        title: Text('Expense title'),
        trailing: Text('0.00'),
      ),
    );
  }
}
