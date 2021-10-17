// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'dart:math' show sqrt;
import 'package:dart_euler/src/utilities.dart' show isPerfectSquare;

/// Returns the [n]-th triangle number.
///
/// A triangular number `T_n` is defined as `T_n = n * (n + 1) / 2`.
int _calculateTriangularNumber(int n) => n * (n + 1) ~/ 2;

/// Checks if the given [number] is pentagonal.
///
/// A pentagonal number `P_n` is defined as `P_n = n * (3 * n - 1) / 2`. By
/// solving this equation for `n` and only considering the positive solution,
/// we arrive at the following criterion: Any number `P` is pentagonal iff there
/// exists a natural number `n` that fulfills `n = (sqrt(24 * P + 1) + 1) / 6`.
bool _isPentagonal(int number) {
  final temp = (24 * number) + 1;
  if (!isPerfectSquare(temp)) return false;
  return (sqrt(temp) + 1) % 6 == 0;
}

/// Checks if the given [number] is hexagonal.
///
/// A hexagonal number `H_n` is defined as  `H_n = n * (2 * n - 1)`. By solving
/// this equation for `n` and only considering the positive solution, we arrive
/// at the following criterion: Any number `H` is hexagonal iff there exists a
/// natural number `n` that fulfills `n = (sqrt(8 * H + 1) + 1) / 4`.
bool _isHexagonal(int number) {
  final temp = (8 * number) + 1;
  if (!isPerfectSquare(temp)) return false;
  return (sqrt(temp) + 1) % 4 == 0;
}

/// Returns the first triangular number which is also pentagonal and hexagonal.
///
/// This is the solution to Project Euler problem 45.
///
/// Triangular, pentagonal and hexagonal numbers are generated by the following
/// formulae:
/// * Triangular: `T_n = n * (n + 1) / 2`     ==> 1, 3, 6, 10, 15, ...
/// * Pentagonal: `P_n = n * (3 * n - 1) / 2` ==> 1, 5, 12, 22, 35, ...
/// * Hexagonal:  `H_n = n * (2 * n - 1)`     ==> 1, 6, 15, 28, 45, ...
///
/// The function finds the first triangular number, testing all numbers starting
/// from the given [startIndex], which is also pentagonal as well as hexagonal.
/// It asserts that the [startIndex] is at least 1.
///
/// Examples:
/// ```dart
/// // T_1 == P_1 == H_1 == 1
/// triangularPentagonalHexagonal(1) == 1
/// // T_285 == P_165 == H_143 == 40755
/// triangularPentagonalHexagonal(2) == 40755
/// ```
int triangularPentagonalHexagonal(int startIndex) {
  assert(startIndex >= 1);

  var index = startIndex;
  var triangleNumber = _calculateTriangularNumber(index);

  while (!_isPentagonal(triangleNumber) || !_isHexagonal(triangleNumber)) {
    triangleNumber = _calculateTriangularNumber(++index);
  }
  return triangleNumber;
}
