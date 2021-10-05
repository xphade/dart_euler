// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

/// Determines the index of the first Fibonacci number with [nDigits] digits.
///
/// This is the solution to Project Euler problem 25.
///
/// The function calculates the Fibonacci sequence until the current number
/// contains the given [nDigits] digits. It then returns the index of this
/// number. For a definition of the Fibonacci sequence, see the documentation of
/// [evenFibonacciNumbers].
///
/// Example:
/// ```dart
/// // 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...
/// nDigitsFibonacciNumber(2) == 7
/// nDigitsFibonacciNumber(3) == 12
/// ```
int nDigitFibonacciNumber(int nDigits) {
  assert(nDigits > 0);

  if (nDigits == 1) return 1;

  var prevNumber = BigInt.from(1);
  var curNumber = BigInt.from(1);
  var index = 2;

  while (curNumber.toString().length < nDigits) {
    var nextNumber = prevNumber + curNumber;
    prevNumber = curNumber;
    curNumber = nextNumber;
    index++;
  }

  return index;
}
