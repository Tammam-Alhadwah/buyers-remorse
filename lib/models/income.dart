// ===========================================================================
// income.dart  -  the Income model  (money coming IN).
//
// STUB for a later task. Same shape as expense.dart.
// ===========================================================================

class Income {
  final int? id;
  final String title;
  final double amount;
  final String source; // where the money came from (salary, gift, ...)
  final DateTime date;

  Income({
    this.id,
    required this.title,
    required this.amount,
    required this.source,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'source': source,
      'date': date.toIso8601String(),
    };
  }

  factory Income.fromMap(Map<String, dynamic> map) {
    return Income(
      id: map['id'] as int?,
      title: map['title'] as String,
      amount: map['amount'] as double,
      source: map['source'] as String,
      date: DateTime.parse(map['date'] as String),
    );
  }
}
