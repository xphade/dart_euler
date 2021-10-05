// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

/// Calculates the sum of multiples of 3 or 5 for all numbers below [limit].
///
/// This is the solution to Project Euler problem 1.
///
/// The function finds all natural numbers below [limit] that are multiples of 3
/// or 5 and returns their sum. It asserts that the given [limit] is
/// non-negative.
///
/// Example:
/// ```dart
/// sumOfMultiples(10) == 23 // 3 + 5 + 6 + 9
/// sumOfMultiples(20) == 78 // 3 + 5 + 6 + 9 + 10 + 12 + 15 + 18
/// ```
int sumOfMultiples(int limit) {
  assert(!limit.isNegative);

  var sum = 0;
  for (var i = 1; i < limit; i++) {
    if (i % 3 == 0 || i % 5 == 0) sum += i;
  }

  return sum;
}
