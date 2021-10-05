// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'package:dart_euler/src/utilities.dart' show isPrime, nextPrime;

/// Calculates the largest prime factor of the given [number].
///
/// This is the solution to Project Euler problem 3.
///
/// The function performs prime factorization using the "Ladder Method". It
/// iteratively divides the [number] by the smallest possible prime until the
/// largest prime factor remains. The function asserts that the given [number]
/// is at least 2 (the first prime number).
///
/// Examples
/// ```dart
/// largestPrimeFactor(28) == 7     // 28 = 2 * 2 * 7
/// largestPrimeFactor(13195) == 29 // 13195 = 5 * 7 * 13 * 29
/// ```
int largestPrimeFactor(int number) {
  assert(number >= 2);

  // 2 is the smallest prime, so start with that.
  var currentPrimeFactor = 2;

  while (!isPrime(number)) {
    while (number % currentPrimeFactor == 0) {
      number ~/= currentPrimeFactor;
    }
    currentPrimeFactor = nextPrime(currentPrimeFactor);
  }

  // The biggest factor remains.
  return number;
}
