// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'package:dart_euler/src/utilities.dart';

/// Computes the n-th prime number.
///
/// This is the solution to Project Euler problem 7.
///
/// This function computes the n-th prime number according to the given [index].
/// It asserts that the index is a positive integer.
///
/// Examples:
/// ```dart
/// computePrime(1) == 2
/// computePrime(2) == 3
/// computePrime(6) == 13
/// ```
int computePrime(int index) {
  assert(index > 0);

  var prime = 2;
  for (var i = 1; i < index; i++) {
    prime = nextPrime(prime);
  }
  return prime;
}
