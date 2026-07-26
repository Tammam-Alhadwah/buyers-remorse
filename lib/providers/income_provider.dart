// ===========================================================================
// income_provider.dart  -  holds the list of incomes in memory and tells the
// screens to refresh when it changes.
//
// STUB for a later task. Same idea as expense_provider.dart.
// Needs the "provider" package:  flutter pub add provider
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/income.dart';
import '../database/database_helper.dart';

class IncomeProvider extends ChangeNotifier {
  final DatabaseHelper _db = DatabaseHelper();

  List<Income> _incomes = [];
  List<Income> get incomes => _incomes;

  Future<void> loadIncomes() async {
    // Later: _incomes = await _db.getAllIncomes();
    notifyListeners();
  }

  Future<void> addIncome(Income income) async {
    // Later: await _db.addIncome(income);
    await loadIncomes();
  }

  Future<void> deleteIncome(int id) async {
    // Later: await _db.deleteIncome(id);
    await loadIncomes();
  }
}
