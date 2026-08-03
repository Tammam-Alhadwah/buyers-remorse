// ===========================================================================
// expense_card.dart  -  one row of the expenses list.
//
// A "widget" file holds a small UI piece you reuse in many places, so you
// don't copy-paste the same layout. Pass an Expense in, get a nice card out.
//
// It only DISPLAYS: no database calls, no navigation. The screen that uses it
// decides what a tap means, by passing onTap. That keeps the card reusable
// (the dashboard's "last 5 operations" list can use the very same card).
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/expense.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../utils/category_style.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;
  final VoidCallback? onTap;

  const ExpenseCard({super.key, required this.expense, this.onTap});

  @override
  Widget build(BuildContext context) {
    // The colors come from the category row that the JOIN brought with us.
    final color = categoryColor(expense.categoryColor);
    final icon = categoryIcon(expense.categoryIcon);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: kPadding,
          vertical: 6,
        ),
        // A pale circle of the category color with its icon inside.
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(
          expense.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis, // long titles never break the row
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          // "No category" covers the case where the category was deleted.
          '${expense.categoryName ?? 'No category'}  •  '
          '${formatDate(expense.expenseDate)}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        // The minus sign makes it obvious this is money going OUT.
        trailing: Text(
          '-${formatAmount(expense.amount)}',
          style: const TextStyle(
            color: kExpenseColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
