// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

/// Counts all Sundays that fall on the first of a month.
///
/// This is the solution to Project Euler problem 19.
///
/// The function counts all Sundays that fall on the first of a month between
/// the given [start] and [end] date. The function asserts that the [start] date
/// is before the [end] date.
///
/// Note that this is a very simple solution to the problem using Dart's
/// built-in `DateTime` class for handling date and time. The real desired
/// solution probably involves coding the gregorian calendar logic yourself.
///
/// TODO: Implement gregorian calendar logic.
///
/// Example:
/// ```
/// // 3 Sundays on the first of a month in 2020 & 2021:
/// // March 2020, November 2020, August 2021
/// countSundaysOnFirst(DateTime(2020, 01, 01), DateTime(2021, 12, 31)) == 3
/// ```
int countSundaysOnFirst(DateTime start, DateTime end) {
  assert(start.isBefore(end));

  var currentDay = start;
  var count = 0;

  while (!end.isBefore(currentDay)) {
    if (currentDay.weekday == DateTime.sunday && currentDay.day == 1) count++;
    currentDay = currentDay.add(Duration(days: 1));
  }

  return count;
}
