// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'dart:io';
import 'dart:math' show sqrt;
import 'package:dart_euler/src/utilities.dart' show isPerfectSquare;

/// Checks if the given [number] is triangular.
///
/// A triangular number `T_n` is defined as `T_n = (n * (n + 1)) / 2`. By
/// solving this equation for `n` and only considering the positive solution,
/// we arrive at the following criterion: Any number `T` is triangular iff there
/// exists a natural number `n` that fulfills `n = (sqrt(8 * T + 1) - 1) / 2`.
bool _isTriangular(int number) {
  final temp = (8 * number) + 1;
  if (!isPerfectSquare(temp)) return false;
  return (sqrt(temp) - 1) % 2 == 0;
}

/// Calculates the numerical value of the given [word].
int _calculateWordValue(String word) {
  // Determine the offset such that the character 'A' has a value of 1.
  final offset = 'A'.codeUnits.first - 1;
  return word.codeUnits
      .map((characterValue) => characterValue - offset)
      .fold(0, (previousValue, currentValue) => previousValue + currentValue);
}

/// Counts the words with a triangular numerical value in a given file.
///
/// This is the solution to Project Euler problem 42.
///
/// The function first extracts the contents of the file specified by [path]. It
/// expects a list of words separated by commas, as it is given in the problem
/// description. It then calculates the numerical value of each word (where 'A'
/// = 1, 'B' = 2, ...) and counts how many of them are triangular numbers. The
/// function asserts that the given file [path] exists.
int codedTriangleNumbers(String path) {
  final file = File(path);
  assert(file.existsSync());

  // Extract the list of words from the file (with upper-case letters only).
  final fileContent = file.readAsStringSync();
  final words = fileContent.replaceAll('"', '').toUpperCase().split(',');

  int triangleWordCount = 0;
  for (final word in words) {
    final value = _calculateWordValue(word);
    if (_isTriangular(value)) triangleWordCount++;
  }
  return triangleWordCount;
}
