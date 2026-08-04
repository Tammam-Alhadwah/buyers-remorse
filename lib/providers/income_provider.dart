// ===========================================================================
// income_provider.dart  -  holds the list of incomes in memory and tells the
// screens to refresh when it changes.
//
// Same idea, same shape and same rules as expense_provider.dart, minus the
// categories: income is not classified in this project, so there is no
// grouping and no JOIN.
//
// The two providers stay separate rather than becoming one "money provider"
// because they own two different tables. The dashboard is the only place that
// needs both, and it simply listens to both.
// ===========================================================================

import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/income.dart';
import '../database/database_helper.dart';
import '../utils/date_ranges.dart';
import '../utils/formatters.dart';

class IncomeProvider extends ChangeNotifier {
  // -------------------------------------------------------------------------
  // SINGLETON - one list for the whole app. See expense_provider.dart.
  // -------------------------------------------------------------------------
  static final IncomeProvider _instance = IncomeProvider._internal();
  factory IncomeProvider() => _instance;
  IncomeProvider._internal();

  final DatabaseHelper _db = DatabaseHelper();

  List<Income> _incomes = [];
  bool _isLoading = false;
  String? _errorMessage;
  bool _hasLoadedOnce = false;

  List<Income> get incomes => List.unmodifiable(_incomes);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasLoadedOnce => _hasLoadedOnce;
  bool get isEmpty => _incomes.isEmpty;

  // =========================================================================
  // LOADING AND CRUD
  // =========================================================================

  Future<void> loadIncomes() async {
    _isLoading = true;
    _errorMessage = null;

    // scheduleMicrotask, not a plain notifyListeners(): this is the only
    // notification that happens before an await, and a screen calling
    // loadIncomes() from initState would otherwise ask Flutter to redraw a
    // widget it is still building. See expense_provider.dart.
    scheduleMicrotask(notifyListeners);

    try {
      _incomes = await _db.getAllIncomes(); // newest first
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Could not load your incomes.';
      _incomes = [];
    }

    _isLoading = false;
    _hasLoadedOnce = true;
    notifyListeners();
  }

  Future<void> ensureLoaded() async {
    if (_hasLoadedOnce || _isLoading) return;
    await loadIncomes();
  }

  // FR10.
  Future<void> addIncome(Income income) async {
    await _db.addIncome(income);
    await loadIncomes();
  }

  // FR11. false = 0 rows changed, so the income no longer exists.
  Future<bool> updateIncome(Income income) async {
    final changed = await _db.updateIncome(income);
    await loadIncomes();
    return changed > 0;
  }

  // FR12.
  Future<void> deleteIncome(int id) async {
    await _db.deleteIncome(id);
    await loadIncomes();
  }

  Future<Income?> getById(int id) => _db.getIncomeById(id);

  // =========================================================================
  // STATISTICS  -  calculated from the list already in memory
  // =========================================================================

  List<Income> inRange(DateRange range) {
    return _incomes.where((income) => range.contains(income.incomeDate)).toList();
  }

  // Total earned. No range = all time.
  double totalIn([DateRange? range]) {
    final list = range == null ? _incomes : inRange(range);
    return list.fold<double>(0.0, (sum, income) => sum + income.amount);
  }

  double get total => totalIn();

  // {'2026-08-01': 500000.0, ...} - the income side of the daily chart.
  Map<String, double> dailyTotals(DateRange range) {
    final result = <String, double>{};
    for (final income in inRange(range)) {
      final key = toDbDate(income.incomeDate);
      result[key] = (result[key] ?? 0.0) + income.amount;
    }
    return result;
  }

  // Twelve numbers, January -> December.
  List<double> monthlyTotals(int year) {
    final months = List<double>.filled(12, 0.0);
    for (final income in _incomes) {
      if (income.incomeDate.year != year) continue;
      months[income.incomeDate.month - 1] += income.amount;
    }
    return months;
  }

  List<Income> recent(int count) {
    return _incomes.take(count).toList();
  }
}