// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'package:dart_euler/src/utilities.dart' show pow;

/// Calculates the sum of digits of [base]^[exponent].
///
/// This is the solution to Project Euler problem 16.
///
/// The function asserts that both [base] and [exponent] are non-negative
/// integers.
///
/// Examples:
/// ```dart
/// powerDigitSum(2, 15) == 26  // 2^15 = 32768 ==> 3 + 2 + 7 + 6 + 8 = 26
/// powerDigitSum(15, 2) == 225 // 15^2 = 225   ==> 2 + 2 + 5 = 9
/// ```
int powerDigitSum(int base, int exponent) {
  assert(!base.isNegative && !exponent.isNegative);

  final number = pow(base, exponent);
  final digits = number
      .toString()
      .runes
      .map((rune) => int.parse(String.fromCharCode(rune)));

  return digits.fold(0, (previousValue, element) => previousValue + element);
}
