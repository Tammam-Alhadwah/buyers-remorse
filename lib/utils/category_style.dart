// ===========================================================================
// category_style.dart  -  turns the TEXT stored in the categories table into
// real Flutter objects (an IconData and a Color).
//
// The database can only hold text, but the UI needs Icons.restaurant and
// Color(0xFFD2544F). This file is the bridge, and it is the only place that
// knows the list of allowed icons - the category screens will reuse it.
// ===========================================================================

import 'package:flutter/material.dart';

import 'constants.dart';

// -------------------------------------------------------------------------
// ICONS
// -------------------------------------------------------------------------
// key (stored in the database)  ->  icon (shown on screen).
// Everything here is const, so Flutter can safely keep these icons in the
// release build. Add a new pair to support a new icon.
const Map<String, IconData> kCategoryIcons = {
  'food': Icons.restaurant,
  'transport': Icons.directions_bus,
  'bills': Icons.receipt_long,
  'entertainment': Icons.movie,
  'health': Icons.local_hospital,
  'education': Icons.school,
  'shopping': Icons.shopping_bag,
  'home': Icons.home,
  'other': Icons.category,
};

// Never throws: an unknown or missing key falls back to a neutral icon.
IconData categoryIcon(String? key) {
  return kCategoryIcons[key] ?? Icons.category;
}

// -------------------------------------------------------------------------
// COLORS
// -------------------------------------------------------------------------
// '#RRGGBB' -> Color. We add 0xFF000000 to make the color fully opaque,
// because a Color needs 8 hex digits (alpha + red + green + blue) and we
// only store 6.
Color categoryColor(String? hex) {
  if (hex == null) return kPrimaryColor;

  final cleaned = hex.replaceAll('#', '').trim();
  if (cleaned.length != 6) return kPrimaryColor;

  final value = int.tryParse(cleaned, radix: 16);
  if (value == null) return kPrimaryColor;

  return Color(value | 0xFF000000);
}

// The choices offered by the category form. Keeping them next to the map
// above means a new icon is added in exactly one place.
List<String> get kCategoryIconKeys => kCategoryIcons.keys.toList();

// A small, deliberately limited palette. A free colour picker would let a
// user choose white on white; a fixed set always looks right with the theme.
const List<String> kCategoryColorOptions = [
  '#E4572E', // orange red
  '#D2544F', // red
  '#F2A65A', // amber
  '#3BA776', // green
  '#1E5F8C', // primary blue
  '#4FA3C4', // light blue
  '#6C5B7B', // purple
  '#8E44AD', // violet
  '#2C3E50', // dark slate
  '#7A8B99', // grey
];
