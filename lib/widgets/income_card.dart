// ===========================================================================
// income_card.dart  -  one row of the incomes list.
//
// The twin of expense_card.dart, in green and with a "+" instead of a "-".
// Like that card it only DISPLAYS: the screen passes in what a tap, an edit
// or a delete should do, so the same card can be reused anywhere later
// (for example in the dashboard's "last 5 operations").
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/income.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';

class IncomeCard extends StatelessWidget {
  final Income income;
  final VoidCallback? onTap; // whole row tapped
  final VoidCallback? onEdit; // menu -> Edit
  final VoidCallback? onDelete; // menu -> Delete

  const IncomeCard({
    super.key,
    required this.income,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: kPadding, right: 4),
        leading: CircleAvatar(
          backgroundColor: kIncomeColor.withValues(alpha: 0.15),
          child: const Icon(Icons.savings, color: kIncomeColor),
        ),
        title: Text(
          income.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis, // long titles never break the row
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          formatDate(income.incomeDate),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        // The amount and the actions menu sit together on the right.
        // mainAxisSize.min stops the Row from trying to fill the screen.
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '+${formatAmount(income.amount)}',
              style: const TextStyle(
                color: kIncomeColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            // A three-dot menu: it keeps Edit and Delete visible without
            // hiding them behind a gesture the user has to guess.
            PopupMenuButton<String>(
              tooltip: 'Actions',
              onSelected: (value) {
                if (value == 'edit') onEdit?.call();
                if (value == 'delete') onDelete?.call();
              },
              itemBuilder: (context) => const [
                PopupMenuItem(
                  value: 'edit',
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.edit, color: kPrimaryColor),
                    title: Text('Edit'),
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.delete, color: kExpenseColor),
                    title: Text('Delete'),
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
