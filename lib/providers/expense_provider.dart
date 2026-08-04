// ===========================================================================
// expense_provider.dart  -  holds the list of expenses in memory and tells
// the screens to refresh when it changes.
//
// THE PROBLEM IT SOLVES
// Without it, every screen loads from the database on its own and keeps its
// own copy. Add an expense on one screen and the dashboard behind it is
// already wrong - it only fixes itself if that screen remembers to reload.
//
// With it: ONE provider owns the list. Screens listen to it. When the list
// changes, notifyListeners() redraws every screen that is showing it, at the
// same moment, with the same data.
//
// WHY THERE IS NO "provider" PACKAGE IMPORT
// The specification allows Flutter, Dart and SQLite. ChangeNotifier is part
// of Flutter itself, and Flutter's own ListenableBuilder can listen to it, so
// the pattern works with nothing added to pubspec.yaml. The provider package
// only adds a nicer way to find this object from the widget tree - here the
// object is a singleton, so any screen can simply write ExpenseProvider().
//
// WHERE THE NUMBERS COME FROM
// The dashboard and the reports do NOT query the database again. Everything
// they show (totals, category breakdown, charts) is calculated from the list
// that is already in memory, by the getters at the bottom of this file. The
// database is asked once; the statistics follow from that answer.
// ===========================================================================

import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/expense.dart';
import '../database/database_helper.dart';
import '../utils/date_ranges.dart';
import '../utils/formatters.dart';

// ---------------------------------------------------------------------------
// One line of the "where did the money go?" report: a category and its total.
//
// It lives here, not in models/, because it is not a table. models/ mirrors
// the four tables of the database; this is a result the provider calculates.
// ---------------------------------------------------------------------------
class CategoryTotal {
  final int? categoryId; // null = the category was deleted
  final String name;
  final String? icon; // key for utils/category_style.dart
  final String? color; // '#RRGGBB'
  final double total;

  const CategoryTotal({
    required this.categoryId,
    required this.name,
    required this.total,
    this.icon,
    this.color,
  });

  // This category's share of a grand total, as 0.0 -> 1.0.
  // Dividing by zero in Dart gives NaN instead of an error, which would
  // silently paint a broken chart, so the guard lives here once.
  double shareOf(double grandTotal) {
    if (grandTotal <= 0) return 0.0;
    return total / grandTotal;
  }
}

// ChangeNotifier = a class that can shout "I changed!" to anyone listening.
class ExpenseProvider extends ChangeNotifier {
  // -------------------------------------------------------------------------
  // SINGLETON - the same three lines as DatabaseHelper, for the same reason.
  // Two ExpenseProvider objects would mean two lists, and a screen listening
  // to the wrong one would never refresh. Writing ExpenseProvider() anywhere
  // in the app always returns this one object.
  // -------------------------------------------------------------------------
  static final ExpenseProvider _instance = ExpenseProvider._internal();
  factory ExpenseProvider() => _instance;
  ExpenseProvider._internal();

  final DatabaseHelper _db = DatabaseHelper();

  // ---- the state ----
  // Private, so no screen can add a row to the list behind the provider's
  // back (that would change the data without redrawing anybody).
  List<Expense> _expenses = [];
  bool _isLoading = false;
  String? _errorMessage;
  bool _hasLoadedOnce = false;

  // ---- read-only views for the screens ----
  // List.unmodifiable: the screens may read the list, never edit it.
  List<Expense> get expenses => List.unmodifiable(_expenses);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasLoadedOnce => _hasLoadedOnce;
  bool get isEmpty => _expenses.isEmpty;

  // =========================================================================
  // LOADING AND CRUD
  // =========================================================================
  // Every write goes through here rather than through DatabaseHelper directly.
  // That is what keeps the promise above: after any change the list is read
  // again and every listening screen is told.

  Future<void> loadExpenses() async {
    _isLoading = true;
    _errorMessage = null;

    // WHY scheduleMicrotask AND NOT A PLAIN notifyListeners()
    // This is the only notify that happens synchronously, before any await.
    // If a screen calls loadExpenses() from initState, a plain notify would ask
    // Flutter to redraw a widget it is still building, which throws. A
    // microtask runs as soon as the current work finishes - after the build -
    // so screens can call this from anywhere without thinking about it.
    scheduleMicrotask(notifyListeners); // screens show their spinner

    try {
      _expenses = await _db.getAllExpenses(); // newest first, category JOINed
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Could not load your expenses.';
      _expenses = [];
    }

    _isLoading = false;
    _hasLoadedOnce = true;
    notifyListeners(); // screens redraw with the result
  }

  // Loads only the first time. A screen that opens second should show the
  // data immediately instead of blinking a spinner over a list we already
  // have.
  Future<void> ensureLoaded() async {
    if (_hasLoadedOnce || _isLoading) return;
    await loadExpenses();
  }

  // FR5. Reloading afterwards costs one cheap local query and gives us the
  // new row WITH its category columns filled in by the JOIN - cheaper to do
  // than to rebuild that row correctly by hand.
  Future<void> addExpense(Expense expense) async {
    await _db.addExpense(expense);
    await loadExpenses();
  }

  // FR6. Returns false when 0 rows changed, which means the expense was
  // deleted from somewhere else while this screen was open.
  Future<bool> updateExpense(Expense expense) async {
    final changed = await _db.updateExpense(expense);
    await loadExpenses();
    return changed > 0;
  }

  // FR7.
  Future<void> deleteExpense(int id) async {
    await _db.deleteExpense(id);
    await loadExpenses();
  }

  // FR9: one fresh row, read straight from the database so a details screen
  // never shows values that were edited meanwhile.
  Future<Expense?> getById(int id) => _db.getExpenseById(id);

  // FR16 - FR20. This one does NOT touch _expenses on purpose.
  //
  // The full list is STATE: many screens share it and must agree on it.
  // A search result is a one-off ANSWER to a question the user just asked,
  // and it is answered by SQLite with a WHERE clause - which is exactly what
  // a database is for, and far better than filtering thousands of rows in
  // Dart.
  Future<List<Expense>> search({
    String? text,
    DateRange? range,
    int? categoryId,
    double? minAmount,
    double? maxAmount,
  }) {
    return _db.searchExpenses(
      text: text,
      range: range,
      categoryId: categoryId,
      minAmount: minAmount,
      maxAmount: maxAmount,
    );
  }

  // =========================================================================
  // STATISTICS  -  all calculated from the list already in memory
  // =========================================================================
  // These are plain getters, not Futures: the data is here, so the answer is
  // immediate and a screen can use it directly inside build().

  // The expenses of one period (FR21 day, FR22 week, FR23 month, FR24 year -
  // all four are just different ranges).
  List<Expense> inRange(DateRange range) {
    return _expenses
        .where((expense) => range.contains(expense.expenseDate))
        .toList();
  }

  // Total spent. No range = all time.
  double totalIn([DateRange? range]) {
    final list = range == null ? _expenses : inRange(range);
    // fold walks the list carrying a running sum.
    return list.fold<double>(0.0, (sum, expense) => sum + expense.amount);
  }

  double get total => totalIn();

  // Sum per category, biggest first.
  //
  // A Map is used as the accumulator: the category id is the key, so every
  // expense finds its group in one step instead of searching the list again
  // for each category.
  List<CategoryTotal> byCategory({DateRange? range}) {
    final list = range == null ? _expenses : inRange(range);

    final groups = <int?, CategoryTotal>{};
    for (final expense in list) {
      final existing = groups[expense.categoryId];
      groups[expense.categoryId] = CategoryTotal(
        categoryId: expense.categoryId,
        // The name, icon and colour travel with the expense already, because
        // getAllExpenses() LEFT JOINs the categories table. Deleting a
        // category leaves its expenses with no name, so they are grouped
        // under a readable label instead of vanishing from the report.
        name: expense.categoryName ?? 'Uncategorized',
        icon: expense.categoryIcon,
        color: expense.categoryColor,
        total: (existing?.total ?? 0.0) + expense.amount,
      );
    }

    final result = groups.values.toList();
    result.sort((a, b) => b.total.compareTo(a.total)); // biggest first
    return result;
  }

  // The dashboard's "biggest spending category". Null when nothing was spent.
  CategoryTotal? topCategory({DateRange? range}) {
    final totals = byCategory(range: range);
    return totals.isEmpty ? null : totals.first;
  }

  // {'2026-08-03': 12500.0, ...} for the daily bar chart. Days with nothing
  // spent are simply absent; the chart draws them as zero.
  Map<String, double> dailyTotals(DateRange range) {
    final result = <String, double>{};
    for (final expense in inRange(range)) {
      final key = toDbDate(expense.expenseDate);
      result[key] = (result[key] ?? 0.0) + expense.amount;
    }
    return result;
  }

  // Twelve numbers, January -> December, for the yearly bar chart. Starting
  // from twelve zeros means a year with three active months still draws a
  // twelve-bar chart.
  List<double> monthlyTotals(int year) {
    final months = List<double>.filled(12, 0.0);
    for (final expense in _expenses) {
      if (expense.expenseDate.year != year) continue;
      months[expense.expenseDate.month - 1] += expense.amount;
    }
    return months;
  }

  // The newest few, for the dashboard. The list arrives sorted by the SQL
  // ORDER BY, so "newest" is simply the front of it.
  List<Expense> recent(int count) {
    return _expenses.take(count).toList();
  }
}