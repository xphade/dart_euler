// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'dart:math' show max;
import 'package:dart_euler/src/utilities.dart' show isPrime, permuteList;

/// Permutes the digits of the given [number] and returns all permutations.
List<int> _permuteNumber(int number) {
  final digits = number.toString().split('').map(int.parse).toList();
  final permutations = permuteList(digits);

  final permutedNumbers = <int>[];
  for (final permutation in permutations) {
    permutedNumbers.add(int.parse(permutation.join("")));
  }

  return permutedNumbers;
}

/// Calculates the largest n-digit pandigital prime.
///
/// This is the solution to Project Euler problem 41.
///
/// A n-digit number is called pandigital if it makes use of each number from 1
/// to n exactly once. As an example, 231 is a 3-digit pandigital number. This
/// function calculates the largest n-digit pandigital number that is also
/// prime.
int largestPandigitalPrime() {
  // In our decimal system, we can have at most 9 digits.
  var maxNumber = 9;
  int? largestPandigitalPrime;

  while (largestPandigitalPrime == null) {
    // Generate all pandigital prime numbers using permutation.
    final numbers = List.generate(maxNumber, (index) => index + 1);
    final primePermutations =
        _permuteNumber(int.parse(numbers.join(""))).where(isPrime);

    if (primePermutations.isNotEmpty) {
      largestPandigitalPrime = primePermutations.reduce(max);
    }

    maxNumber--;
  }

  return largestPandigitalPrime;
}
