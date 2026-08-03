// ===========================================================================
// income.dart  -  the Income model  (money coming IN).
//
// Mirrors the incomes table from the specification:
//    incomes(id, title, amount, income_date, notes)
//
// Same shape as expense.dart, minus the category: income is not classified in
// this project, so there is no category_id and no JOIN.
// ===========================================================================

import '../utils/formatters.dart';

class Income {
  final int? id;
  final String title;
  final double amount;
  final DateTime incomeDate;
  final String notes;

  Income({
    this.id,
    required this.title,
    required this.amount,
    required this.incomeDate,
    this.notes = '',
  });

  // Object -> Map (for saving). The date is written in the database format
  // 'yyyy-MM-dd' - never the pretty screen format.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'income_date': toDbDate(incomeDate),
      'notes': notes,
    };
  }

  // Map -> Object (for reading).
  factory Income.fromMap(Map<String, dynamic> map) {
    return Income(
      id: map['id'] as int?,
      title: (map['title'] as String?) ?? '',
      // A REAL column can come back as int (20 instead of 20.0), so we read
      // it as num first. Casting straight to double crashes.
      amount: (map['amount'] as num?)?.toDouble() ?? 0.0,
      incomeDate: parseDbDate(map['income_date'] as String?),
      notes: (map['notes'] as String?) ?? '',
    );
  }

  Income copyWith({
    int? id,
    String? title,
    double? amount,
    DateTime? incomeDate,
    String? notes,
  }) {
    return Income(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      incomeDate: incomeDate ?? this.incomeDate,
      notes: notes ?? this.notes,
    );
  }
}
