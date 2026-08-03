// ===========================================================================
// expense.dart  -  the Expense model  (money going OUT).
//
// Mirrors the expenses table from the specification:
//    expenses(id, title, amount, expense_date, category_id, notes)
//
// The Dart names are camelCase, the columns are snake_case; toMap/fromMap do
// the translation so no screen ever writes a column name by hand.
// ===========================================================================

import '../utils/formatters.dart';

class Expense {
  final int? id;
  final String title;
  final double amount;
  final DateTime expenseDate;
  final int? categoryId; // null = the category was deleted
  final String notes;

  // -------------------------------------------------------------------------
  // DISPLAY-ONLY FIELDS
  // -------------------------------------------------------------------------
  // These do NOT exist in the expenses table. getAllExpenses() JOINs the
  // categories table and fills them in, so a list can show the category name,
  // icon and color without asking the database once per row (the classic
  // "N+1 queries" mistake). They are never written back - see toMap().
  final String? categoryName;
  final String? categoryIcon;
  final String? categoryColor;

  Expense({
    this.id,
    required this.title,
    required this.amount,
    required this.expenseDate,
    this.categoryId,
    this.notes = '',
    this.categoryName,
    this.categoryIcon,
    this.categoryColor,
  });

  // Object -> Map (for saving). Only real columns are listed here.
  // 'id' is included so update() knows which row to change; on insert it is
  // null and SQLite generates the value.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'expense_date': toDbDate(expenseDate), // always 'yyyy-MM-dd'
      'category_id': categoryId,
      'notes': notes,
    };
  }

  // Map -> Object (for reading).
  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'] as int?,
      title: (map['title'] as String?) ?? '',
      // A REAL column can come back as int (e.g. 20 instead of 20.0),
      // so we read it as num and convert. Casting straight to double crashes.
      amount: (map['amount'] as num?)?.toDouble() ?? 0.0,
      expenseDate: parseDbDate(map['expense_date'] as String?),
      categoryId: map['category_id'] as int?,
      notes: (map['notes'] as String?) ?? '',
      // Present only when the query JOINed the categories table.
      categoryName: map['category_name'] as String?,
      categoryIcon: map['category_icon'] as String?,
      categoryColor: map['category_color'] as String?,
    );
  }

  Expense copyWith({
    int? id,
    String? title,
    double? amount,
    DateTime? expenseDate,
    int? categoryId,
    String? notes,
  }) {
    return Expense(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      expenseDate: expenseDate ?? this.expenseDate,
      categoryId: categoryId ?? this.categoryId,
      notes: notes ?? this.notes,
      categoryName: categoryName,
      categoryIcon: categoryIcon,
      categoryColor: categoryColor,
    );
  }
}
