// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

/// Detects the smallest multiple of all numbers between [low] and [high].
///
/// This is the solution to Project Euler problem 5.
///
/// The function detects the smallest number which is divisible by all the
/// numbers in range [[low], [high]]. It asserts that both inputs are positive
/// and [low] is smaller or equal to [high].
///
/// Example:
/// ```dart
/// smallestMultiple(1, 10) == 2520
/// smallestMultiple(1, 20) == 232792560
/// ```
int smallestMultiple(int low, int high) {
  assert(low > 0 && high > 0);
  assert(low <= high);

  var number = 0;
  var divisible = false;

  while (!divisible) {
    number++;
    divisible = true;

    for (var i = low; i <= high; i++) {
      if (number % i != 0) {
        divisible = false;
        break;
      }
    }
  }

  return number;
}
