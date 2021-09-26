/// Calculates the sum of digits of [base]^[exponent].
///
/// This is the solution to Project Euler problem 16.
///
/// The function asserts that both [base] and [exponent] are non-negative
/// integers. For the case 0^0, the function return 1.
///
/// Examples:
/// ```dart
/// powerDigitSum(2, 15) == 26  // 2^15 = 32768 ==> 3 + 2 + 7 + 6 + 8 = 26
/// powerDigitSum(15, 2) == 225 // 15^2 = 225   ==> 2 + 2 + 5 = 9
/// ```
int powerDigitSum(int base, int exponent) {
  assert(!base.isNegative && !exponent.isNegative);

  // Special case: 0^0 equals 1, so return 1.
  if (base == 0 && exponent == 0) return 1;

  var number = BigInt.from(1);
  final bigIntBase = BigInt.from(base);

  // Do not use `math.pow` in order to avoid overflow issues.
  for (var i = 0; i < exponent; i++) {
    number *= bigIntBase;
  }

  final digits = number
      .toString()
      .runes
      .map((rune) => int.parse(String.fromCharCode(rune)));

  return digits.fold(0, (previousValue, element) => previousValue + element);
}
