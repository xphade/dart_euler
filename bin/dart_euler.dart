import 'package:dart_euler/dart_euler.dart' as de;

void main() {
  print("1.  Multiples of 3 or 5:         ${de.sumOfMultiples(20)}");
  print("2.  Even Fibonacci numbers:      ${de.evenFibonacciNumbers(4000000)}");

  final result04 = de.largestPalindromeProduct(3);
  final message04 = result04 == null
      ? "None"
      : "${result04.product} (${result04.x} x ${result04.y})";
  print("4.  Largest palindrome product:  $message04");

  print("5.  Smallest multiple:           ${de.smallestMultiple(1, 20)}");
  print("6.  Sum square difference:       ${de.sumSquareDifference(100)}");

  final result14 = de.longestCollatzSequence(1000000);
  final message14 =
      "${result14.longestChainNumber} (${result14.maxChainLength} steps)";
  print("14. Longest Collatz sequence:    $message14");

  print("16. Power digit sum:             ${de.powerDigitSum(2, 1000)}");
  print("20. Factorial digit sum:         ${de.factorialDigitSum(100)}");
  print("25. 1000-digit Fibonacci number: ${de.nDigitFibonacciNumber(1000)}");
  print("29. Distinct powers:             ${de.distinctPowers(2, 100)}");
}
