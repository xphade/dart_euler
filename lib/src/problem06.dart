// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'dart:math' show pow;

/// Calculates the sum square difference of all numbers up until [maxNum].
///
/// This is the solution to Project Euler problem 6.
///
/// The function calculates the difference between the squared sum and the sum
/// of squares of all numbers in range [1, [maxNum]]. It asserts that the given
/// [maxNum] is a positive integer.
///
/// The squared sum is defined as `(1 + 2 + ... + maxNum)^2`. The sum of squares
/// is defined as `1^2 + 2^2 + ... + maxNum^2`.
///
/// Example:
/// ```dart
/// // (1 + ... + 10)^2 - (1^2 + ... + 10^2) = 3025 - 385 = 2640
/// sumSquareDifference(10) == 2640
/// ```
int sumSquareDifference(int maxNum) {
  assert(maxNum > 0);

  final numberSequence = List.generate(maxNum, (index) => index + 1);
  final sumOfSquares = numberSequence
      .map((number) => pow(number, 2) as int)
      .reduce((value, number) => value + number);
  final squaredSum =
      pow(numberSequence.reduce((value, number) => value + number), 2) as int;

  return squaredSum - sumOfSquares;
}
