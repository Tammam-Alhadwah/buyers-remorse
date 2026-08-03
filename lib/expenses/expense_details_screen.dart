// ===========================================================================
// expense_details_screen.dart  -  FR9: show ALL the data of one expense,
// plus the two actions that belong to a single row: edit (FR6) and delete
// with a confirmation message (FR7).
//
// It keeps its own copy of the expense and refreshes it from the database
// after an edit, so the screen can never show stale values.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/expense.dart';
import '../database/database_helper.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../utils/category_style.dart';
import 'edit_expense_screen.dart';

class ExpenseDetailsScreen extends StatefulWidget {
  final Expense expense;

  const ExpenseDetailsScreen({super.key, required this.expense});

  @override
  State<ExpenseDetailsScreen> createState() => _ExpenseDetailsScreenState();
}

class _ExpenseDetailsScreenState extends State<ExpenseDetailsScreen> {
  late Expense expense = widget.expense;
  bool isDeleting = false;

  void _showMessage(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? kExpenseColor : kIncomeColor,
      ),
    );
  }

  // Opens the edit screen and, when it returns, reads the row again so the
  // details we show are the ones actually stored.
  Future<void> openEdit() async {
    final saved = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => EditExpenseScreen(expense: expense)),
    );

    if (!mounted || saved != true) return;

    final fresh = await DatabaseHelper().getExpenseById(expense.id!);
    if (!mounted) return;

    if (fresh == null) {
      // Someone deleted it meanwhile - there is nothing left to show.
      Navigator.pop(context, true);
      return;
    }

    setState(() => expense = fresh);
  }

  // FR7: delete, but never without asking first.
  Future<void> confirmAndDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete expense'),
        // Naming the expense in the question prevents "wrong row" accidents.
        content: Text(
          'Delete "${expense.title}" (${formatAmount(expense.amount)})?\n'
          'This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            style: TextButton.styleFrom(foregroundColor: kExpenseColor),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    setState(() => isDeleting = true);
    try {
      await DatabaseHelper().deleteExpense(expense.id!);
      if (!mounted) return;
      Navigator.pop(context, true); // back to the list, which reloads
    } catch (e) {
      if (!mounted) return;
      setState(() => isDeleting = false);
      _showMessage('Could not delete the expense. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = categoryColor(expense.categoryColor);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit',
            onPressed: isDeleting ? null : openEdit,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Delete',
            onPressed: isDeleting ? null : confirmAndDelete,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(kPadding),
        children: [
          // ---- HEADER: the amount, impossible to miss ----
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 28),
            decoration: BoxDecoration(
              color: kExpenseColor,
              borderRadius: BorderRadius.circular(kRadius),
            ),
            child: Column(
              children: [
                Icon(
                  categoryIcon(expense.categoryIcon),
                  color: Colors.white,
                  size: 40,
                ),
                const SizedBox(height: 12),
                Text(
                  '-${formatAmount(expense.amount)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  expense.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ---- EVERY FIELD OF THE ROW ----
          _DetailRow(
            icon: Icons.title,
            label: 'Title',
            value: expense.title,
          ),
          _DetailRow(
            icon: Icons.payments,
            label: 'Amount',
            value: formatAmount(expense.amount),
          ),
          _DetailRow(
            icon: Icons.calendar_today,
            label: 'Date',
            value: formatDate(expense.expenseDate),
          ),
          _DetailRow(
            icon: categoryIcon(expense.categoryIcon),
            iconColor: color,
            label: 'Category',
            value: expense.categoryName ?? 'No category (it was deleted)',
          ),
          _DetailRow(
            icon: Icons.notes,
            label: 'Notes',
            value: expense.notes.isEmpty ? '-' : expense.notes,
          ),
          _DetailRow(
            icon: Icons.tag,
            label: 'Record number',
            value: '#${expense.id}',
          ),

          const SizedBox(height: 20),

          // A second, easier-to-reach delete button. Same function as the
          // app bar icon - written once, used twice.
          OutlinedButton.icon(
            onPressed: isDeleting ? null : confirmAndDelete,
            icon: const Icon(Icons.delete_outline),
            label: Text(isDeleting ? 'DELETING...' : 'DELETE EXPENSE'),
            style: OutlinedButton.styleFrom(
              foregroundColor: kExpenseColor,
              minimumSize: const Size.fromHeight(50),
              side: const BorderSide(color: kExpenseColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// One "label + value" line. Private to this file; it exists so the six lines
// above are six short calls instead of six copies of the same Row.
// ---------------------------------------------------------------------------
class _DetailRow extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor ?? kPrimaryColor),
        title: Text(label, style: const TextStyle(color: Colors.grey)),
        subtitle: Text(
          value,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
