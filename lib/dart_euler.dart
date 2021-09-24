/// Calculates the factorial of [n] through recursion.
BigInt _factorial(BigInt n) {
  if (n <= BigInt.from(1)) return BigInt.from(1);
  return n * _factorial(n - BigInt.from(1));
}

/// Calculates the digit sum of the factorial of the given [number].
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

/// Detects the smallest multiple of all numbers between [low] and [high].
///
/// The function detects the smallest number which is divisible by all the
/// numbers in range [low, high]. It asserts that both inputs are positive and
/// [low] is smaller or equal to [high].
///
/// Example:
/// ```dart
/// smallestMultiple(1, 10) == 2520
/// smallestMultiple(1, 20) == 232792560
/// ```
int smallestMultiple(int low, int high) {
  assert(low > 0 && high > 0);
  assert(low <= high);

  var number = 0;
  var divisible = false;

  while (!divisible) {
    number++;
    divisible = true;

    for (var i = low; i <= high; i++) {
      if (number % i != 0) {
        divisible = false;
        break;
      }
    }
  }

  return number;
}
