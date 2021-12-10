// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'package:dart_euler/src/utilities.dart' show isPrime, nextPrime;

/// Truncates the given [number] from right to left.
int _truncateToLeft(int number) {
  final numberString = number.toString();
  return int.parse(numberString.substring(0, numberString.length - 1));
}

/// Truncates the given [number] from left to right
int _truncateToRight(int number) {
  final numberString = number.toString();
  return int.parse(numberString.substring(1));
}

/// Truncates the [number] in both directions and returns all resulting numbers.
List<int> _generateTruncatedNumbers(int number) {
  var truncatedLeft = number;
  var truncatedRight = number;
  final truncatedNumbers = <int>[];

  while (truncatedLeft >= 10) {
    truncatedLeft = _truncateToLeft(truncatedLeft);
    truncatedNumbers.add(truncatedLeft);
  }

  while (truncatedRight >= 10) {
    truncatedRight = _truncateToRight(truncatedRight);
    truncatedNumbers.add(truncatedRight);
  }

  return truncatedNumbers;
}

/// Returns the sum of the first [count] truncatable primes.
///
/// This is the solution Project Euler problem 37.
///
/// The function calculates the first [count] truncatable primes and returns the
/// sum of them. A truncatable prime has the following properties:
/// * The number itself is prime
/// * Removing digits from left and right yields only primes as well
///
/// One example of such a number is 317 (17, 7, 31, 3). Since there exist only
/// 11 such numbers, the function asserts that 1 <= [count] <= 11. Note that 2,
/// 3, 5 and 7 are not considered truncatable primes.
///
/// Example:
/// ```dart
/// truncatablePrimes(3) == 113 // 23 + 37 + 53 = 113
/// ```
int truncatablePrimes(int count) {
  assert(count >= 1 && count <= 11);

  var sum = 0;
  var numbersFound = 0;
  var currentNumber = 11;

  while (numbersFound < count) {
    final truncatedNumbers = _generateTruncatedNumbers(currentNumber);
    final isTruncatablePrime = truncatedNumbers.every((n) => isPrime(n));

    if (isTruncatablePrime) {
      sum += currentNumber;
      numbersFound++;
    }
    currentNumber = nextPrime(currentNumber);
  }

  return sum;
}
