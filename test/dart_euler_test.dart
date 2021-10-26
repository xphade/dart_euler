// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'package:dart_euler/problems.dart';
import 'package:test/test.dart';

Matcher throwsAssertion = throwsA(isA<AssertionError>());

void main() {
  test('#01 sumOfMultiples', () {
    expect(() => sumOfMultiples(-1), throwsAssertion);
    expect(sumOfMultiples(0), 0);
    expect(sumOfMultiples(2), 0);
    expect(sumOfMultiples(10), 23);
    expect(sumOfMultiples(1000), 233168);
  });

  test('#02 evenFibonacciNumber', () {
    expect(() => evenFibonacciNumbers(-1), throwsAssertion);
    expect(evenFibonacciNumbers(0), 0);
    expect(evenFibonacciNumbers(1), 0);
    expect(evenFibonacciNumbers(2), 2);
    expect(evenFibonacciNumbers(100), 44);
    expect(evenFibonacciNumbers(4000000), 4613732);
  });

  test('#03 largestPrimeFactor', () {
    expect(() => largestPrimeFactor(-1), throwsAssertion);
    expect(() => largestPrimeFactor(0), throwsAssertion);
    expect(() => largestPrimeFactor(1), throwsAssertion);
    expect(largestPrimeFactor(2), 2);
    expect(largestPrimeFactor(28), 7);
    expect(largestPrimeFactor(13195), 29);
    expect(largestPrimeFactor(600851475143), 6857);
  });

  test('#04 largestPalindromeProduct', () {
    expect(() => largestPalindromeProduct(-1), throwsAssertion);
    expect(() => largestPalindromeProduct(0), throwsAssertion);

    var res = largestPalindromeProduct(1);
    expect(res?.product, 9);
    res = largestPalindromeProduct(2);
    expect(res?.product, 9009);
    res = largestPalindromeProduct(3);
    expect(res?.product, 906609);
  });

  test('#05 smallestMultiple', () {
    expect(() => smallestMultiple(2, -3), throwsAssertion);
    expect(() => smallestMultiple(-3, -2), throwsAssertion);
    expect(() => smallestMultiple(3, 2), throwsAssertion);
    expect(smallestMultiple(2, 2), 2);
    expect(smallestMultiple(1, 10), 2520);
    expect(smallestMultiple(1, 20), 232792560);
  });

  test('#06 sumSquareDifference', () {
    expect(() => sumSquareDifference(-1), throwsAssertion);
    expect(() => sumSquareDifference(0), throwsAssertion);
    expect(sumSquareDifference(1), 0);
    expect(sumSquareDifference(10), 2640);
    expect(sumSquareDifference(100), 25164150);
  });

  test('#07 computePrime', () {
    expect(() => computePrime(-1), throwsAssertion);
    expect(() => computePrime(0), throwsAssertion);
    expect(computePrime(1), 2);
    expect(computePrime(6), 13);
    expect(computePrime(10001), 104743);
  });

  test('#08 largestProductInSeries', () {
    expect(() => largestProductInSeries(-2), throwsAssertion);
    expect(() => largestProductInSeries(0), throwsAssertion);
    expect(() => largestProductInSeries(1), throwsAssertion);
    expect(() => largestProductInSeries(1001), throwsAssertion);
    expect(largestProductInSeries(2), 81);
    expect(largestProductInSeries(4), 5832);
    expect(largestProductInSeries(13), 23514624000);
    expect(largestProductInSeries(100), 0);
  });

  test('#09 specialPythagoreanTriplet', () {
    expect(() => specialPythagoreanTriplet(-1), throwsAssertion);
    expect(() => specialPythagoreanTriplet(0), throwsAssertion);
    expect(() => specialPythagoreanTriplet(5), throwsAssertion);

    expect(specialPythagoreanTriplet(6), isNull);
    expect(specialPythagoreanTriplet(10), isNull);

    var res = specialPythagoreanTriplet(12);
    expect(res?.product, 60);

    res = specialPythagoreanTriplet(1000);
    expect(res?.product, 31875000);
  });

  test('#10 summationOfPrimes', () {
    expect(summationOfPrimes(-2), 0);
    expect(summationOfPrimes(2), 0);
    expect(summationOfPrimes(3), 2);
    expect(summationOfPrimes(10), 17);
    expect(summationOfPrimes(2000000), 142913828922);
  });

  test('#11 largestProductInGrid', () {
    expect(largestProductInGrid(), 70600674);
  });

  test('#12 divisibleTriangleNumber', () {
    expect(() => divisibleTriangleNumber(-1), throwsAssertion);
    expect(divisibleTriangleNumber(0), 1);
    expect(divisibleTriangleNumber(1), 3);
    expect(divisibleTriangleNumber(4), 28);
    expect(divisibleTriangleNumber(500), 76576500);
  });

  test('#13 largeSum', () {
    expect(() => largeSum(-1), throwsAssertion);
    expect(() => largeSum(0), throwsAssertion);
    expect(largeSum(1), BigInt.from(5));
    expect(largeSum(2), BigInt.from(55));
    expect(largeSum(10), BigInt.from(5537376230));
    expect(largeSum(100),
        BigInt.parse("5537376230390876637302048746832985971773659831892672"));
  });

  test('#14 longestCollatzSequence', () {
    expect(() => longestCollatzSequence(-1), throwsAssertion);
    expect(() => longestCollatzSequence(0), throwsAssertion);

    var res = longestCollatzSequence(10);
    expect(res.longestChainNumber, 9);
    expect(res.maxChainLength, 20);

    res = longestCollatzSequence(1000000);
    expect(res.longestChainNumber, 837799);
    expect(res.maxChainLength, 525);
  });

  test('#15 countLatticePaths', () {
    expect(() => countLatticePaths(-1), throwsAssertion);
    expect(() => countLatticePaths(0), throwsAssertion);
    expect(countLatticePaths(1), 2);
    expect(countLatticePaths(2), 6);
    expect(countLatticePaths(20), 137846528820);
  });

  test('#16 powerDigitSum', () {
    expect(() => powerDigitSum(-1, 1), throwsAssertion);
    expect(() => powerDigitSum(1, -1), throwsAssertion);
    expect(() => powerDigitSum(-1, -1), throwsAssertion);
    expect(powerDigitSum(0, 0), 1);
    expect(powerDigitSum(10, 0), 1);
    expect(powerDigitSum(0, 10), 0);
    expect(powerDigitSum(2, 15), 26);
    expect(powerDigitSum(15, 2), 9);
    expect(powerDigitSum(2, 1000), 1366);
  });

  test('#17 numberLetterCounts', () {
    expect(() => numberLetterCounts(-1, 10), throwsAssertion);
    expect(() => numberLetterCounts(10, 5), throwsAssertion);
    expect(() => numberLetterCounts(1, 2000), throwsAssertion);
    expect(numberLetterCounts(1, 1), 3);
    expect(numberLetterCounts(1, 5), 19);
    expect(numberLetterCounts(99, 101), 36);
    expect(numberLetterCounts(1, 1000), 21124);
  });

  test('#18 maximumPathSum', () {
    expect(() => maximumPathSum(-1), throwsAssertion);
    expect(maximumPathSum(0), 75);
    expect(maximumPathSum(1), 170);
    expect(maximumPathSum(2), 221);
    expect(maximumPathSum(14), 1074);
    expect(maximumPathSum(28), 1074);
  });

  test('#19 countSundaysOnFirst', () {
    expect(
        () =>
            countSundaysOnFirst(DateTime(2021, 10, 21), DateTime(2021, 10, 20)),
        throwsAssertion);
    expect(
        () =>
            countSundaysOnFirst(DateTime(2021, 10, 21), DateTime(2021, 10, 21)),
        throwsAssertion);
    expect(
        countSundaysOnFirst(DateTime(2021, 01, 01), DateTime(2021, 06, 30)), 0);
    expect(
        countSundaysOnFirst(DateTime(2021, 07, 01), DateTime(2021, 12, 31)), 1);
    expect(countSundaysOnFirst(DateTime(1901, 01, 01), DateTime(2000, 12, 31)),
        171);
  });

  test('#20 factorialDigitSum', () {
    expect(() => factorialDigitSum(-1), throwsAssertion);
    expect(factorialDigitSum(0), 1);
    expect(factorialDigitSum(5), 3);
    expect(factorialDigitSum(10), 27);
    expect(factorialDigitSum(100), 648);
  });

  test('#21 sumOfAmicableNumbers', () {
    expect(() => sumOfAmicableNumbers(-10), throwsAssertion);
    expect(sumOfAmicableNumbers(0), 0);
    expect(sumOfAmicableNumbers(10), 0);
    expect(sumOfAmicableNumbers(100), 0);
    expect(sumOfAmicableNumbers(250), 220);
    expect(sumOfAmicableNumbers(300), 504);
    expect(sumOfAmicableNumbers(1000), 504);
    expect(sumOfAmicableNumbers(10000), 31626);
  });

  test('#22 sumOfNameScores', () {
    expect(() => sumOfNameScores('/non/existing/path'), throwsAssertion);
    expect(sumOfNameScores('lib/res/p022_names.txt'), 871198282);
  });

  test('#25 nDigitsFibonacciNumber', () {
    expect(() => nDigitFibonacciNumber(-1), throwsAssertion);
    expect(() => nDigitFibonacciNumber(0), throwsAssertion);
    expect(nDigitFibonacciNumber(1), 1);
    expect(nDigitFibonacciNumber(3), 12);
    expect(nDigitFibonacciNumber(1000), 4782);
  });

  test('#29 distinctPowers', () {
    expect(() => distinctPowers(-2, -1), throwsAssertion);
    expect(() => distinctPowers(0, 1), throwsAssertion);
    expect(() => distinctPowers(2, 2), throwsAssertion);
    expect(distinctPowers(1, 2), 3);
    expect(distinctPowers(2, 5), 15);
    expect(distinctPowers(2, 100), 9183);
  });

  test('#35 circularPrimes', () {
    expect(circularPrimes(-1), 0);
    expect(circularPrimes(0), 0);
    expect(circularPrimes(2), 0);
    expect(circularPrimes(3), 1);
    expect(circularPrimes(100), 13);
    expect(circularPrimes(1000000), 55);
  });

  test('#36 doubleBasePalindromes', () {
    expect(() => doubleBasePalindromes(-1), throwsAssertion);
    expect(() => doubleBasePalindromes(0), throwsAssertion);
    expect(() => doubleBasePalindromes(1), throwsAssertion);
    expect(doubleBasePalindromes(2), 1);
    expect(doubleBasePalindromes(10), 25);
    expect(doubleBasePalindromes(1000000), 872187);
  });

  test('#42 codedTriangleNumbers', () {
    expect(() => codedTriangleNumbers('/non/existing/path'), throwsAssertion);
    expect(codedTriangleNumbers('lib/res/p042_words.txt'), 162);
  });

  test('#45 triangularPentagonalHexagonal', () {
    expect(() => triangularPentagonalHexagonal(-1), throwsAssertion);
    expect(() => triangularPentagonalHexagonal(0), throwsAssertion);
    expect(triangularPentagonalHexagonal(1), 1);
    expect(triangularPentagonalHexagonal(2), 40755);
    expect(triangularPentagonalHexagonal(100), 40755);
    expect(triangularPentagonalHexagonal(286), 1533776805);
  });
}
