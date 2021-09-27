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
