// ===========================================================================
// date_ranges.dart  -  a start date + an end date, and the four ranges the
// reports need (FR21 daily, FR22 weekly, FR23 monthly, FR24 yearly).
//
// WHY A CLASS INSTEAD OF TWO LOOSE DateTime VARIABLES?
// Every report query needs a pair of dates that belong together. Passing them
// separately invites the classic bug of swapping them by accident. One object
// also means the "what is this week?" rule is written ONCE, here, instead of
// being re-invented in every screen.
//
// Both ends are INCLUSIVE: an expense dated exactly on `end` is inside the
// range. That matches how the SQL uses it (BETWEEN ? AND ? is inclusive too).
//
// No Flutter imports here on purpose - this is pure logic, so the database
// layer can use it without dragging the UI in.
// ===========================================================================

import 'package:intl/intl.dart';

import 'formatters.dart';

class DateRange {
  final DateTime start; // first day, included
  final DateTime end; // last day, included

  const DateRange(this.start, this.end);

  // ---- FR21: one single day ----
  factory DateRange.day(DateTime value) {
    final day = dateOnly(value);
    return DateRange(day, day);
  }

  // ---- FR22: the week that contains `value`, Monday -> Sunday ----
  //
  // weekday is 1 for Monday ... 7 for Sunday, so subtracting (weekday - 1)
  // days always lands on the Monday of that week.
  //
  // We rebuild the date with DateTime(y, m, d - n) instead of
  // subtract(Duration(days: n)). Duration counts HOURS, so on the night the
  // clock changes (daylight saving) it can land on the wrong day. Asking for
  // "day number 3 minus 5" has no such problem: Dart rolls the month back for
  // us, and day 0 means "the last day of the previous month".
  factory DateRange.week(DateTime value) {
    final day = dateOnly(value);
    final start = DateTime(day.year, day.month, day.day - (day.weekday - 1));
    final end = DateTime(start.year, start.month, start.day + 6);
    return DateRange(start, end);
  }

  // ---- FR23: the whole month that contains `value` ----
  //
  // The trick in the second line: day 0 of the NEXT month is the last day of
  // THIS month, so we never have to remember which months have 30 or 31 days,
  // and February works in leap years for free.
  factory DateRange.month(DateTime value) {
    return DateRange(
      DateTime(value.year, value.month, 1),
      DateTime(value.year, value.month + 1, 0),
    );
  }

  // ---- FR24: the whole year that contains `value` ----
  factory DateRange.year(DateTime value) {
    return DateRange(DateTime(value.year, 1, 1), DateTime(value.year, 12, 31));
  }

  // Is one date inside the range? (Used by screens, not by SQL.)
  bool contains(DateTime value) {
    final day = dateOnly(value);
    return !day.isBefore(start) && !day.isAfter(end);
  }

  // How many days the range covers, including both ends.
  int get days => end.difference(start).inDays + 1;

  // A short title for the report header, e.g.
  //   'Today'  /  '03 - 09 Aug 2026'  /  'August 2026'  /  '2026'
  String get label {
    if (start == end) {
      final today = dateOnly(DateTime.now());
      if (start == today) return 'Today';
      return formatDate(start);
    }

    // A full calendar year.
    if (start.month == 1 && start.day == 1 && end.month == 12 && end.day == 31) {
      return DateFormat('yyyy').format(start);
    }

    // A full calendar month.
    if (start.day == 1 && end.day == DateTime(end.year, end.month + 1, 0).day &&
        start.month == end.month && start.year == end.year) {
      return DateFormat('MMMM yyyy').format(start);
    }

    // Anything else (a week, or a range the user picked by hand).
    return '${formatDate(start)} - ${formatDate(end)}';
  }
}