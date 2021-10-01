import 'package:dart_euler/dart_euler.dart' as de;

void main() {
  print('1.  Multiples of 3 or 5:         ${de.sumOfMultiples(20)}');
  print('2.  Even Fibonacci numbers:      ${de.evenFibonacciNumbers(4000000)}');
  print('3.  Largest prime factor:        '
      '${de.largestPrimeFactor(600851475143)}');

  final result04 = de.largestPalindromeProduct(3)!;
  final message04 = '${result04.product} (${result04.x} x ${result04.y})';
  print('4.  Largest palindrome product:  $message04');

  print('5.  Smallest multiple:           ${de.smallestMultiple(1, 20)}');
  print('6.  Sum square difference:       ${de.sumSquareDifference(100)}');
  print('7.  10001st prime:               ${de.computePrime(10001)}');
  print('8.  Largest product in a series: ${de.largestProductInSeries(13)}');

  final result09 = de.specialPythagoreanTriplet(1000)!;
  final message09 = '${result09.product} '
      '(a = ${result09.a}, b = ${result09.b}, c = ${result09.c})';
  print('9.  Special Pythagorean triplet: $message09');

  print('10. Summation of primes:         ${de.summationOfPrimes(2000000)}');

  final result14 = de.longestCollatzSequence(1000000);
  final message14 =
      '${result14.longestChainNumber} (${result14.maxChainLength} steps)';
  print('14. Longest Collatz sequence:    $message14');

  print('16. Power digit sum:             ${de.powerDigitSum(2, 1000)}');
  print('20. Factorial digit sum:         ${de.factorialDigitSum(100)}');
  print('25. 1000-digit Fibonacci number: ${de.nDigitFibonacciNumber(1000)}');
  print('29. Distinct powers:             ${de.distinctPowers(2, 100)}');
}
