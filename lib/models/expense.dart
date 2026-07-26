// ===========================================================================
// expense.dart  -  the Expense model  (money going OUT).
//
// STUB for a later task. When you build the expenses feature, fill this in
// the same way as user.dart (fields + toMap + fromMap).
// ===========================================================================

class Expense {
  final int? id;
  final String title;
  final double amount;
  final String category;
  final DateTime date;

  Expense({
    this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });

  // Object -> Map (for saving). DateTime is not supported by SQLite,
  // so we store it as text using toIso8601String().
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category,
      'date': date.toIso8601String(),
    };
  }

  // Map -> Object (for reading). We turn the text back into a DateTime.
  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'] as int?,
      title: map['title'] as String,
      amount: map['amount'] as double,
      category: map['category'] as String,
      date: DateTime.parse(map['date'] as String),
    );
  }
}
