/// Calculates the sum of all even Fibonacci numbers not exceeding [limit].
///
/// This is the solution to Project Euler problem 2.
///
/// The function calculates the Fibonacci sequence up until the given [limit]
/// and returns the sum of all the even numbers. It asserts that the [limit] is
/// non-negative.
///
/// The Fibonacci sequence is defined by `F_n = F_{n-2} + F_{n-1}` where `f_1 =
/// f_2 = 1`.
///
/// Example:
/// ```dart
/// // 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...
/// evenFibonacciNumbers(20) == 10  // 2 + 8
/// evenFibonacciNumbers(100) == 44 // 2 + 8 + 34
/// ```
int evenFibonacciNumbers(int limit) {
  assert(!limit.isNegative);

  // 2 is the first even number in the Fibonacci sequence.
  if (limit < 2) return 0;

  var prevNumber = 1;
  var curNumber = 2;
  var sum = 0;

  while (curNumber <= limit) {
    if (curNumber.isEven) sum += curNumber;

    final nextNumber = prevNumber + curNumber;
    prevNumber = curNumber;
    curNumber = nextNumber;
  }

  return sum;
}
