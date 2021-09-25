import 'dart:math' as math;

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
/// numbers in range \[low, high]. It asserts that both inputs are positive and
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

/// Computes the Collatz sequence starting from [startValue].
List<int> _collatz(int startValue) {
  var sequence = <int>[startValue];
  var value = startValue;

  while (value != 1) {
    value = value.isEven ? value ~/ 2 : 3 * value + 1;
    sequence.add(value);
  }

  return sequence;
}

/// Helper class to return the result of the [longestCollatzSequence] function.
class LCSResult {
  final int longestChainNumber;
  final int maxChainLength;
  LCSResult(this.longestChainNumber, this.maxChainLength);
}

/// Finds the longest Collatz sequence of all start values from 1 to [limit].
///
/// The function calculates the Collatz sequence for all start values in range
/// \[1, limit]. It then returns the number producing the longest chain with its
/// corresponding length.
///
/// The Collatz sequence is defined as
/// * `n -> n/2`    if `n` is even
/// * `n -> 3n + 1` if `n` is odd
///
/// The function asserts that the given [limit] is a positive integer.
LCSResult longestCollatzSequence(int limit) {
  assert(limit > 0);

  var maxChainLength = 0;
  var longestChainNumber = 0;

  for (var i = 1; i < limit; i++) {
    final sequence = _collatz(i);

    if (sequence.length > maxChainLength) {
      maxChainLength = sequence.length;
      longestChainNumber = i;
    }
  }

  return LCSResult(longestChainNumber, maxChainLength);
}

/// Determines the index of the first Fibonacci number with [nDigits] digits.
///
/// The function calculates the Fibonacci sequence until the current number
/// contains the given [nDigits] digits. It then returns the index of this
/// number.
///
/// The Fibonacci sequence is defined by `F_n = F_{n-2} + F_{n-1}` where `f_1 =
/// f_2 = 1`.
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

/// Calculates the sum of multiples of 3 or 5 for all numbers below [limit].
///
/// The function finds all natural numbers below [limit] that are multiples of 3
/// or 5 and returns their sum. It asserts that the given [limit] is
/// non-negative.
///
/// Example:
/// ```dart
/// sumOfMultiples(10) == 23 // 3 + 5 + 6 + 9
/// sumOfMultiples(20) == 78 // 3 + 5 + 6 + 9 + 10 + 12 + 15 + 18
/// ```
int sumOfMultiples(int limit) {
  assert(!limit.isNegative);

  var sum = 0;
  for (var i = 1; i < limit; i++) {
    if (i % 3 == 0 || i % 5 == 0) sum += i;
  }

  return sum;
}

/// Calculates the sum square difference of all numbers up until [maxNum].
///
/// The function calculates the difference between the squared sum and the sum
/// of squares of all numbers in range \[1, maxNum]. It asserts that the given
/// [maxNum] is a positive integer.
///
/// The squared sum is defined as `(1 + 2 + ... + maxNum)^2`. The sum of squares
/// is defined as `1^2 + 2^2 + ... + maxNum^2`.
///
/// Example:
/// ```dart
/// // (1 + ... + 10)^2 - (1^2 + ... + 10^2) = 3025 - 385 = 2640
/// sumSquareDifference(10) == 2640
/// ```
int sumSquareDifference(int maxNum) {
  assert(maxNum > 0);

  final numberSequence = List.generate(maxNum, (index) => index + 1);
  final sumOfSquares = numberSequence
      .map((number) => math.pow(number, 2) as int)
      .reduce((value, number) => value + number);
  final squaredSum = math.pow(
      numberSequence.reduce((value, number) => value + number), 2) as int;

  return squaredSum - sumOfSquares;
}
