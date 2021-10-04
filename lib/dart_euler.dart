import 'package:dart_euler/problems.dart';

/// Solves the Project Euler problem [number] and returns it as a string.
String _solveSpecificProblem(int number) {
  assert(!number.isNegative);

  if (number == 1) {
    return sumOfMultiples(1000).toString();
  } else if (number == 2) {
    return evenFibonacciNumbers(4000000).toString();
  } else if (number == 3) {
    return largestPrimeFactor(600851475143).toString();
  } else if (number == 4) {
    final result = largestPalindromeProduct(3)!;
    return '${result.product} (${result.x} x ${result.y})';
  } else if (number == 5) {
    return smallestMultiple(1, 20).toString();
  } else if (number == 6) {
    return sumSquareDifference(100).toString();
  } else if (number == 7) {
    return computePrime(10001).toString();
  } else if (number == 8) {
    return largestProductInSeries(13).toString();
  } else if (number == 9) {
    final result = specialPythagoreanTriplet(1000)!;
    return '${result.product} '
        '(a = ${result.a}, b = ${result.b}, c = ${result.c})';
  } else if (number == 10) {
    return summationOfPrimes(2000000).toString();
  } else if (number == 14) {
    final result = longestCollatzSequence(1000000);
    return '${result.longestChainNumber} (${result.maxChainLength} steps)';
  } else if (number == 16) {
    return powerDigitSum(2, 1000).toString();
  } else if (number == 17) {
    return numberLetterCounts(1, 1000).toString();
  } else if (number == 20) {
    return factorialDigitSum(100).toString();
  } else if (number == 25) {
    return nDigitFibonacciNumber(1000).toString();
  } else if (number == 29) {
    return distinctPowers(2, 100).toString();
  } else {
    return 'Not implemented yet.';
  }
}

/// Prints the solutions to all problems.
void printAllSolutions() {
  print('1.  Multiples of 3 or 5:         ${_solveSpecificProblem(1)}');
  print('2.  Even Fibonacci numbers:      ${_solveSpecificProblem(2)}');
  print('3.  Largest prime factor:        ${_solveSpecificProblem(3)}');
  print('4.  Largest palindrome product:  ${_solveSpecificProblem(4)}');
  print('5.  Smallest multiple:           ${_solveSpecificProblem(5)}');
  print('6.  Sum square difference:       ${_solveSpecificProblem(6)}');
  print('7.  10001st prime:               ${_solveSpecificProblem(7)}');
  print('8.  Largest product in a series: ${_solveSpecificProblem(8)}');
  print('9.  Special Pythagorean triplet: ${_solveSpecificProblem(9)}');
  print('10. Summation of primes:         ${_solveSpecificProblem(10)}');
  print('14. Longest Collatz sequence:    ${_solveSpecificProblem(14)}');
  print('16. Power digit sum:             ${_solveSpecificProblem(16)}');
  print('17. Number letter counts:        ${_solveSpecificProblem(17)}');
  print('20. Factorial digit sum:         ${_solveSpecificProblem(20)}');
  print('25. 1000-digit Fibonacci number: ${_solveSpecificProblem(25)}');
  print('29. Distinct powers:             ${_solveSpecificProblem(29)}');
}

/// Prints the solution to Project Euler problem [number].
void printSpecificSolution(int number) {
  print("Solution to problem $number: ${_solveSpecificProblem(number)}");
}
