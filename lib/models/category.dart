// ===========================================================================
// category.dart  -  the Category model  (e.g. Food, Rent, Transport).
//
// STUB for a later task. Categories group expenses together.
// ===========================================================================

class Category {
  final int? id;
  final String name;
  final int iconCode; // the Icons codePoint, so we can store an icon as a number
  final int colorValue; // a Color stored as a number

  Category({
    this.id,
    required this.name,
    required this.iconCode,
    required this.colorValue,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'iconCode': iconCode,
      'colorValue': colorValue,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int?,
      name: map['name'] as String,
      iconCode: map['iconCode'] as int,
      colorValue: map['colorValue'] as int,
    );
  }
}
