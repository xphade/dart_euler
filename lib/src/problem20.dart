/// Calculates the factorial of [n] through recursion.
BigInt _factorial(BigInt n) {
  if (n <= BigInt.from(1)) return BigInt.from(1);
  return n * _factorial(n - BigInt.from(1));
}

/// Calculates the digit sum of the factorial of the given [number].
///
/// This is the solution to Project Euler problem 20.
///
/// The function asserts that the given [number] is non-negative. The factorial
/// of a number `n` is defined as `n! = n * (n-1) * (n-2) * ... * 1`.
///
/// Example:
/// ```dart
/// factorialDigitSum(4) == 6    // 4! = 4 * 3 * 2 * 1 = 24 ==> 2 + 4 = 6
/// factorialDigitSum(10) == 27  // 10! = 3628800 ==> 3 + 6 + 2 + 8 + 8 = 27
/// ```
int factorialDigitSum(int number) {
  assert(number >= 0);
  final result = _factorial(BigInt.from(number));

  var sum = 0;
  for (final rune in result.toString().runes) {
    sum += int.parse(String.fromCharCode(rune));
  }

  return sum;
}
