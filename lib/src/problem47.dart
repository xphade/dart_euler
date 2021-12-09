// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'package:dart_euler/src/utilities.dart' show getDivisors, isPrime;

/// Returns sorted list of prime factors of the given [number].
List<int> _getSortedPrimeFactors(int number) =>
    getDivisors(number, sorted: true).where(isPrime).toList();

/// Calculates consecutive numbers with equal amount of distinct prime factors.
///
/// This is the solution to Project Euler problem 47.
///
/// The function finds the first `n` consecutive integers with exactly `n`
/// distinct prime factors. The number `n` is given by [distinctFactors]. It
/// then returns the first among them. The function asserts that
/// [distinctFactors] is at least 1.
///
/// As an example, the first two consecutive integers with exactly two distinct
/// prime factors are:
/// * 14 = 2 x 7
/// * 15 = 3 x 5
///
/// Examples:
/// ```dart
/// // 2 is the first prime number.
/// distinctPrimesFactors(1) == 2
/// // 644, 645 and 646 all have four distinct prime factors.
/// distinctPrimesFactors(3) == 644
/// ```
int distinctPrimesFactors(int distinctFactors) {
  assert(distinctFactors >= 1);

  var currentNumber = 2;
  var consecutiveNumbers = 0;

  while (consecutiveNumbers < distinctFactors) {
    final primeFactors = _getSortedPrimeFactors(currentNumber++);

    if (primeFactors.length != distinctFactors) {
      consecutiveNumbers = 0;
    } else {
      consecutiveNumbers++;
    }
  }

  return currentNumber - distinctFactors;
}
