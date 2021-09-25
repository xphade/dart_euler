import 'package:dart_euler/dart_euler.dart';
import 'package:test/test.dart';

Matcher throwsAssertion() => throwsA(const TypeMatcher<AssertionError>());

void main() {
  test('factorialDigitSum', () {
    expect(() => factorialDigitSum(-1), throwsAssertion());
    expect(factorialDigitSum(0), 1);
    expect(factorialDigitSum(5), 3);
    expect(factorialDigitSum(10), 27);
    expect(factorialDigitSum(100), 648);
  });

  test("smallestMultiple", () {
    expect(() => smallestMultiple(2, -3), throwsAssertion());
    expect(() => smallestMultiple(-3, -2), throwsAssertion());
    expect(() => smallestMultiple(3, 2), throwsAssertion());
    expect(smallestMultiple(2, 2), 2);
    expect(smallestMultiple(1, 10), 2520);
    expect(smallestMultiple(1, 20), 232792560);
  });

  test("longestCollatzSequence", () {
    expect(() => longestCollatzSequence(-1), throwsAssertion());
    expect(() => longestCollatzSequence(0), throwsAssertion());

    var res = longestCollatzSequence(10);
    expect(res.longestChainNumber, 9);
    expect(res.maxChainLength, 20);

    res = longestCollatzSequence(1000000);
    expect(res.longestChainNumber, 837799);
    expect(res.maxChainLength, 525);
  });

  test("nDigitsFibonacciNumber", () {
    expect(() => nDigitFibonacciNumber(-1), throwsAssertion());
    expect(() => nDigitFibonacciNumber(0), throwsAssertion());
    expect(nDigitFibonacciNumber(1), 1);
    expect(nDigitFibonacciNumber(3), 12);
    expect(nDigitFibonacciNumber(1000), 4782);
  });
}
