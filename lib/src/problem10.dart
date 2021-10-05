// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'package:dart_euler/src/utilities.dart' show nextPrime;

/// Returns the sum of all primes smaller than the given [limit].
///
/// Examples:
/// ```dart
/// summationOfPrimes(1) == 0   // 2 is the smallest prime number.
/// summationOfPrimes(3) == 2
/// summationOfPrimes(10) == 17 // 2 + 3 + 5 + 7 = 17
/// ```
int summationOfPrimes(int limit) {
  var sum = 0;
  var prime = 2;

  while (prime < limit) {
    sum += prime;
    prime = nextPrime(prime);
  }

  return sum;
}
