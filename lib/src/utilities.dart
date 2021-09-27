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
