// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'dart:math' show sqrt;
import 'package:collection/collection.dart' show ListEquality;

/// Returns [x] to the power of [exponent] as a [BigInt].
///
/// The function supports only non-negative exponents. It defines `x^0 == 1` for
/// all [x] (including 0).
///
/// Examples:
/// ```dart
/// pow(2, 3) == 8
/// pow(-2, 2) == 4
/// pow(-2, 3) == -8
/// pow(0, 0) == 1
/// pow(2, 0) == 1
/// pow(0, 2) == 0
/// ```
BigInt pow(int x, int exponent) {
  assert(!exponent.isNegative);

  // Special case: x^0 = 1 for all x.
  if (exponent == 0) return BigInt.from(1);

  var number = BigInt.from(1);
  final base = BigInt.from(x);

  // Do not use `math.pow` in order to avoid overflow issues.
  for (var i = 0; i < exponent; i++) {
    number *= base;
  }

  return number;
}

/// Checks if the given [number] is a prime.
///
/// A number is called prime if it is a natural number bigger than 1 which
/// cannot be written as the product of two smaller natural numbers.
///
/// The function uses trial division with '6k+-1' optimization as a simple
/// primality test. For reference, see the description of the algorithm at
/// https://en.wikipedia.org/wiki/Primality_test#Simple_methods.
///
/// Examples:
/// ```dart
/// isPrime(1) == false // 2 is the first prime number.
/// isPrime(2) == true
/// isPrime(3) == true
/// isPrime(4) == false // 4 = 2 * 2, so it is not a prime.
/// ```
bool isPrime(int number) {
  // Of all numbers smaller or equal to 3, only 2 and 3 are primes.
  if (number <= 3) return number >= 2;

  // If the number is divisible by 2 or 3, we can immediately return false.
  if (number % 2 == 0 || number % 3 == 0) return false;

  for (var i = 5; i * i <= number; i += 6) {
    if (number % i == 0 || number % (i + 2) == 0) return false;
  }

  return true;
}

/// Determines the next consecutive prime starting from the given [number].
///
/// Examples:
/// ```dart
/// nextPrime(-2) == 2  // 2 is always the first prime.
/// nextPrime(2) == 3
/// nextPrime(13) == 17
/// ```
int nextPrime(int number) {
  if (number < 2) return 2;

  do {
    number++;
  } while (!isPrime(number));

  return number;
}

/// Checks whether two lists contain the same values.
Function _listsEqual = const ListEquality().equals;

/// Checks if the given [term] is a palindrome.
///
/// A palindrome is a term which reads the same in both ways. The [term] can
/// contain arbitrary characters including spaces and punctuation. If the
/// optional [ignoreCase] is set to `true`, the function will treat upper and
/// lower case characters equally. If the given [term] is empty, the function
/// always returns `false`.
///
/// Note that the function is written using `codeUnits`, so it will only work
/// with 16-bit characters.
///
/// Examples:
/// ```dart
/// isPalindrome("racecar") == true
/// isPalindrome("step on no pets") == true
/// isPalindrome("Racecar") == false
/// isPalindrome("Racecar", ignoreCase: true) == true
/// ```
bool isPalindrome(String term, {bool ignoreCase = false}) {
  if (term.isEmpty) return false;
  if (ignoreCase) term = term.toLowerCase();

  final codeUnits = term.codeUnits;
  final unitsReversed = List.from(codeUnits.reversed);

  return _listsEqual(codeUnits, unitsReversed);
}

/// Checks if the given [number] is a palindrome.
///
/// A palindromic number reads the same in both ways. The function has an
/// optional parameter [base] with which the user can specify the desired base
/// of the number (defaults to 10). If the given [number] is negative, the
/// function will always return `false`.
///
/// Examples:
/// ```dart
/// isPalindromicNumber(1) == true
/// isPalindromicNumber(21) == false
/// isPalindromicNumber(232) == true
/// isPalindromicNumber(27, base: 2) == true // 27 is 11011 in binary.
/// ```
bool isPalindromicNumber(int number, {int base = 10}) {
  if (number.isNegative) return false;
  return isPalindrome(number.toRadixString(base));
}

/// Checks if the given [number] is a perfect square.
///
/// A perfect square is defined as a (non-negative) natural number that is the
/// exact square of another such number, i.e. the product of some integer with
/// itself.
///
/// Note that this specific implementation may run into numerical problems if
/// the [number] gets very large. However, it should work fine for our input
/// domains.
///
/// Examples:
/// ```dart
/// isPerfectSquare(4) == true   // 4 = 2 * 2
/// isPerfectSquare(9) == true   // 9 = 3 * 3
/// isPerfectSquare(-1) == false
/// isPerfectSquare(10) == false
/// ```
bool isPerfectSquare(int number) {
  if (number.isNegative) return false;
  final root = sqrt(number).toInt();
  return root * root == number;
}

/// Returns all divisors of the given [number].
///
/// This function returns all factors of any positive natural [number]. If
/// desired, the returned list is guaranteed to be [sorted]. The naive solution
/// to find divisors would be to check every integer from 1 to [number] / 2.
/// However, since all divisors are present in pairs, it is enough to check the
/// range from 1 to sqrt([number]).
///
/// The function asserts that the given [number] is at least 1.
///
/// Examples:
/// ```dart
/// getDivisors(1) == [1]
/// getDivisors(8) == [1, 8, 2, 4]
/// getDivisors(8, sorted: true) == [1, 2, 4, 8]
/// getDivisors(17) == [1, 17]
/// ```
List<int> getDivisors(int number, {sorted = false}) {
  assert(number > 0);

  // If the [number] is a prime, there can only be two divisors.
  if (isPrime(number)) return [1, number];

  final divisors = <int>[];
  for (var i = 1; i * i <= number; i++) {
    if (number % i == 0) {
      divisors.add(i);

      // Add the paired factor if it is not equal.
      final pair = number ~/ i;
      if (pair != i) divisors.add(pair);
    }
  }

  if (sorted) divisors.sort();
  return divisors;
}
