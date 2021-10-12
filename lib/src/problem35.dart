// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'package:dart_euler/src/utilities.dart';

/// Returns the [number], given as a string, rotated one digit to the left.
String _rotateNumber(String number) {
  final numberOfDigits = number.length;

  var rotatedNumber = '';
  for (var i = 0; i < numberOfDigits; i++) {
    final idx = (i + 1) % numberOfDigits;
    rotatedNumber += number[idx];
  }
  return rotatedNumber;
}

/// Checks if all possible rotations of the given [number] are prime.
bool _allRotationsPrime(int number) {
  if (!isPrime(number)) return false;

  var numberString = number.toString();
  final rotations = numberString.length - 1;

  for (var i = 0; i < rotations; i++) {
    numberString = _rotateNumber(numberString);
    if (!isPrime(int.parse(numberString))) return false;
  }

  return true;
}

/// Counts all the circular primes below the given [limit].
///
/// This is the solution to Project Euler problem 35.
///
/// The function counts all circular primes in the natural numbers below the
/// given [limit]. A circular prime is defined as a number where all rotations
/// are themselves prime. For example, 197 is a circular prime because 971 and
/// 719 are prime as well.
///
/// Examples:
/// ```dart
/// // Circular primes <100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, 97.
/// circularPrimes(5) == 2    // 2 and 3.
/// circularPrimes(100) == 13 // All of the above.
/// ```
int circularPrimes(int limit) {
  if (limit <= 2) return 0;

  var count = 0;
  for (var number = 2; number < limit; number++) {
    if (_allRotationsPrime(number)) count++;
  }
  return count;
}
