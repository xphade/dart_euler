import 'package:dart_euler/dart_euler.dart';
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

  test('#20 factorialDigitSum', () {
    expect(() => factorialDigitSum(-1), throwsAssertion);
    expect(factorialDigitSum(0), 1);
    expect(factorialDigitSum(5), 3);
    expect(factorialDigitSum(10), 27);
    expect(factorialDigitSum(100), 648);
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
}
