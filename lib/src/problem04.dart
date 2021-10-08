// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'package:dart_euler/src/utilities.dart';

/// Helper class to return the result of [largestPalindromeProduct].
class LPPResult {
  final int x;
  final int y;

  LPPResult(this.x, this.y);
  int get product => x * y;
  bool get isPalindrome => isPalindromicNumber(product);
}

/// Calculates the largest palindrome from a product of two numbers.
///
/// This is the solution to Project Euler problem 4.
///
/// The function determines the largest palindromic number made from the product
/// of two numbers with the given amount of [digits]. It returns an object of
/// type [LPPResult]. If no palindromic product has been found, the function
/// returns `null`. An assertion is thrown if [digits] is smaller than 1.
///
/// Example:
/// ```dart
/// final result = largestPalindromeProduct(2);
/// print(result.product); // 9009 == 91 * 99
/// ```
LPPResult? largestPalindromeProduct(int digits) {
  assert(digits > 0);

  // Determine start and end number (1-9, 10-99, 100-999, ...).
  final start = int.parse('1${'0' * (digits - 1)}');
  final end = int.parse('9' * digits);

  LPPResult? bestCandidate;

  for (var firstNumber = start; firstNumber <= end; firstNumber++) {
    for (var secondNumber = firstNumber; secondNumber <= end; secondNumber++) {
      final candidate = LPPResult(firstNumber, secondNumber);

      if (bestCandidate == null || bestCandidate.product < candidate.product) {
        if (candidate.isPalindrome) bestCandidate = candidate;
      }
    }
  }

  // TODO: Can it be proven that there's a palindromic number for each choice of
  //  [digits]? If yes, then we could make it non-nullable.
  return bestCandidate;
}
