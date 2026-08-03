// ===========================================================================
// category.dart  -  the Category model  (e.g. Food, Transport, Bills).
//
// Mirrors the categories table from the specification:
//    categories(id, name, icon, color)
//
// Both icon and color are TEXT columns, so we store TEXT:
//   icon  -> a key such as 'food' (see utils/category_style.dart)
//   color -> a hex string such as '#D2544F'
//
// WHY NOT STORE THE ICON AS A NUMBER (its codePoint)?
// Because building an IconData from a number at runtime is not constant, and
// Flutter's release build ("tree shaking") removes icons it cannot see being
// used - the app would then show blank squares. A key + a fixed map keeps
// every icon constant and safe.
// ===========================================================================

class Category {
  final int? id;
  final String name;
  final String icon; // key into kCategoryIcons
  final String color; // '#RRGGBB'

  Category({
    this.id,
    required this.name,
    this.icon = 'other',
    this.color = '#1E5F8C',
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'icon': icon, 'color': color};
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int?,
      name: (map['name'] as String?) ?? '',
      // Old or hand-written rows may hold null; fall back to safe defaults.
      icon: (map['icon'] as String?) ?? 'other',
      color: (map['color'] as String?) ?? '#1E5F8C',
    );
  }

  Category copyWith({int? id, String? name, String? icon, String? color}) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      color: color ?? this.color,
    );
  }
}
