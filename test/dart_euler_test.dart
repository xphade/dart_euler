import 'package:dart_euler/dart_euler.dart';
import 'package:test/test.dart';

Matcher throwsAssertion = throwsA(isA<AssertionError>());

void main() {
  test("sumOfMultiples", () {
    expect(() => sumOfMultiples(-1), throwsAssertion);
    expect(sumOfMultiples(0), 0);
    expect(sumOfMultiples(2), 0);
    expect(sumOfMultiples(10), 23);
    expect(sumOfMultiples(1000), 233168);
  });

  test("evenFibonacciNumber", () {
    expect(() => evenFibonacciNumbers(-1), throwsAssertion);
    expect(evenFibonacciNumbers(0), 0);
    expect(evenFibonacciNumbers(1), 0);
    expect(evenFibonacciNumbers(2), 2);
    expect(evenFibonacciNumbers(100), 44);
    expect(evenFibonacciNumbers(4000000), 4613732);
  });

  test("smallestMultiple", () {
    expect(() => smallestMultiple(2, -3), throwsAssertion);
    expect(() => smallestMultiple(-3, -2), throwsAssertion);
    expect(() => smallestMultiple(3, 2), throwsAssertion);
    expect(smallestMultiple(2, 2), 2);
    expect(smallestMultiple(1, 10), 2520);
    expect(smallestMultiple(1, 20), 232792560);
  });

  test("sumSquareDifference", () {
    expect(() => sumSquareDifference(-1), throwsAssertion);
    expect(() => sumSquareDifference(0), throwsAssertion);
    expect(sumSquareDifference(1), 0);
    expect(sumSquareDifference(10), 2640);
    expect(sumSquareDifference(100), 25164150);
  });

  test("longestCollatzSequence", () {
    expect(() => longestCollatzSequence(-1), throwsAssertion);
    expect(() => longestCollatzSequence(0), throwsAssertion);

    var res = longestCollatzSequence(10);
    expect(res.longestChainNumber, 9);
    expect(res.maxChainLength, 20);

    res = longestCollatzSequence(1000000);
    expect(res.longestChainNumber, 837799);
    expect(res.maxChainLength, 525);
  });

  test('factorialDigitSum', () {
    expect(() => factorialDigitSum(-1), throwsAssertion);
    expect(factorialDigitSum(0), 1);
    expect(factorialDigitSum(5), 3);
    expect(factorialDigitSum(10), 27);
    expect(factorialDigitSum(100), 648);
  });

  test("nDigitsFibonacciNumber", () {
    expect(() => nDigitFibonacciNumber(-1), throwsAssertion);
    expect(() => nDigitFibonacciNumber(0), throwsAssertion);
    expect(nDigitFibonacciNumber(1), 1);
    expect(nDigitFibonacciNumber(3), 12);
    expect(nDigitFibonacciNumber(1000), 4782);
  });
}
