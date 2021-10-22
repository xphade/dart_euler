// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'package:dart_euler/src/utilities.dart' show getDivisors;

/// Returns the sum of proper divisors of the given [number].
int _sumOfProperDivisors(int number) {
  final int sumOfDivisors = getDivisors(number).fold(0, (a, b) => a + b);
  return sumOfDivisors - number;
}

/// Sums up all amicable numbers smaller than [limit] and returns the result.
///
/// This is the solution to Project Euler Problem 21.
///
/// The function finds all amicable numbers below [limit] and returns the sum of
/// them. It asserts that the given [limit] is non-negative.
///
/// An amicable number is one part of an amicable pair. An amicable pair is
/// defined by two numbers `a` and `b` where `a != b` and each sum of proper
/// divisors yields the other number. Let's take `a = 220` as an example:
///
/// * d(220) = 1 + 2 + 4 + 5 + 10 + 11 + 20 + 22 + 44 + 55 + 110 = 284
/// * d(284) = 1 + 2 + 4 + 71 + 142 = 220
/// * It can be seen that `d(a) = b`, `d(b) = a` and `a != b`
/// * Therefore, `a` and `b` are an amicable pair
///
/// Examples:
/// ```dart
/// sumOfAmicableNumbers(100) == 0;   // No amicable numbers below 100.
/// sumOfAmicableNumbers(250) == 220; // d(220) = 284, d(284) = 220.
/// sumOfAmicableNumbers(300) == 504; // Same as above, but now includes 284.
/// ```
int sumOfAmicableNumbers(int limit) {
  assert(!limit.isNegative);

  final amicableNumbers = <int>{};
  for (var i = 2; i < limit; i++) {
    final firstSum = _sumOfProperDivisors(i);
    final secondSum = _sumOfProperDivisors(firstSum);

    if (i == secondSum && firstSum != secondSum) {
      amicableNumbers.add(i);
      if (firstSum < limit) amicableNumbers.add(firstSum);
    }
  }

  return amicableNumbers.fold(0, (a, b) => a + b);
}
