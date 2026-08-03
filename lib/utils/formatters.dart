// ===========================================================================
// formatters.dart  -  turning values into text, in ONE place.
//
// Two different jobs live here, and mixing them up is a classic bug:
//
//   1. DATABASE format  (toDbDate / parseDbDate)
//      Always 'yyyy-MM-dd'. SQLite has no real DATE type - it stores text -
//      and this format is the only one where sorting the TEXT also sorts the
//      dates correctly ('2026-01-09' < '2026-02-01'). It also makes the
//      monthly / yearly reports later a simple LIKE '2026-02%'.
//      NEVER show this format to the user.
//
//   2. SCREEN format  (formatDate / formatAmount)
//      Pretty text for humans. NEVER save this to the database.
//
// This file imports intl only (no Flutter), so models can use it too.
// ===========================================================================

import 'package:intl/intl.dart';

// -------- DATES: database side --------

// Throws away the time part. An expense happens on a DAY; keeping
// hours/minutes would break "is this the same date?" comparisons.
DateTime dateOnly(DateTime value) {
  return DateTime(value.year, value.month, value.day);
}

// DateTime -> '2026-08-03'   (what we store)
String toDbDate(DateTime value) {
  return DateFormat('yyyy-MM-dd').format(value);
}

// '2026-08-03' -> DateTime   (what we read)
// Defensive on purpose: a row written by hand, or an older row, must not
// crash the whole list. If the text is unusable we fall back to today.
DateTime parseDbDate(String? text) {
  if (text == null || text.isEmpty) return dateOnly(DateTime.now());
  final parsed = DateTime.tryParse(text);
  return parsed == null ? dateOnly(DateTime.now()) : dateOnly(parsed);
}

// -------- DATES: screen side --------

// DateTime -> '03 Aug 2026'
String formatDate(DateTime value) {
  return DateFormat('dd MMM yyyy').format(value);
}

// -------- MONEY --------

// 1234.5 -> '1,234.50'
// Always two decimals, so a column of amounts lines up neatly.
String formatAmount(double value) {
  return NumberFormat('#,##0.00').format(value);
}
