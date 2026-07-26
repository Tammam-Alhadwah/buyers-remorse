// ===========================================================================
// expense_provider.dart  -  holds the list of expenses in memory and tells
// the screens to refresh when it changes.
//
// STUB for a later task. This uses the "provider" package for state
// management. You must add it first:
//     flutter pub add provider
//
// Idea: instead of each screen loading from the database on its own, ONE
// provider loads the data and every screen listens to it. When you add or
// delete an expense, notifyListeners() redraws every screen showing that data.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/expense.dart';
import '../database/database_helper.dart';

// ChangeNotifier = a class that can shout "I changed!" to anyone listening.
class ExpenseProvider extends ChangeNotifier {
  final DatabaseHelper _db = DatabaseHelper();

  // The private list of expenses.
  List<Expense> _expenses = [];

  // A read-only view of the list for the screens.
  List<Expense> get expenses => _expenses;

  // Load all expenses from the database.
  Future<void> loadExpenses() async {
    // Later, add a getAllExpenses() function in database_helper.dart:
    //   final rows = await _db.getAllExpenses();
    //   _expenses = rows;

    notifyListeners(); // tell the screens to redraw
  }

  // Add one expense, then reload.
  Future<void> addExpense(Expense expense) async {
    // Later: await _db.addExpense(expense);
    await loadExpenses();
  }

  // Delete one expense, then reload.
  Future<void> deleteExpense(int id) async {
    // Later: await _db.deleteExpense(id);
    await loadExpenses();
  }
}
