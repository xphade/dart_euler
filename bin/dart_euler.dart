import 'dart:io';

import 'package:dart_euler/dart_euler.dart' as de;

void main() {
  print("5.  Smallest multiple:           ${de.smallestMultiple(1, 20)}");

  final result14 = de.longestCollatzSequence(1000000);
  print("14. Longest Collatz sequence:    ${result14.longestChainNumber} "
      "(${result14.maxChainLength})");

  print("20. Factorial digit sum:         ${de.factorialDigitSum(100)}");
  print("25. 1000-digit Fibonacci number: ${de.nDigitFibonacciNumber(1000)}");
}
