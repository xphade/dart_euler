// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'package:dart_euler/src/utilities.dart';
import 'package:test/test.dart';

import 'dart_euler_test.dart' show throwsAssertion;

void main() {
  group('pow', () {
    test('negativeExponent', () {
      expect(() => pow(-2, -2), throwsAssertion);
      expect(() => pow(0, -2), throwsAssertion);
      expect(() => pow(2, -2), throwsAssertion);
    });

    test('zeroExponent', () {
      expect(pow(-2, 0), BigInt.from(1));
      expect(pow(0, 0), BigInt.from(1));
      expect(pow(2, 0), BigInt.from(1));
    });

    test('standardCases', () {
      expect(pow(2, 2), BigInt.from(4));
      expect(pow(-2, 2), BigInt.from(4));
      expect(pow(2, 3), BigInt.from(8));
      expect(pow(-2, 3), BigInt.from(-8));
      expect(pow(7, 4), BigInt.from(2401));
      expect(pow(-7, 4), BigInt.from(2401));
      expect(pow(5, 5), BigInt.from(3125));
      expect(pow(-5, 5), BigInt.from(-3125));
    });

    test('bigNumbers', () {
      // Test a number bigger than the maximum integer or even double.
      expect(
          pow(10, 360),
          BigInt.parse('1'
              '000000000000000000000000000000000000000000000000000000000000'
              '000000000000000000000000000000000000000000000000000000000000'
              '000000000000000000000000000000000000000000000000000000000000'
              '000000000000000000000000000000000000000000000000000000000000'
              '000000000000000000000000000000000000000000000000000000000000'
              '000000000000000000000000000000000000000000000000000000000000'));

      // Also test it for the negative case.
      expect(
          pow(-10, 361),
          BigInt.parse('-10'
              '000000000000000000000000000000000000000000000000000000000000'
              '000000000000000000000000000000000000000000000000000000000000'
              '000000000000000000000000000000000000000000000000000000000000'
              '000000000000000000000000000000000000000000000000000000000000'
              '000000000000000000000000000000000000000000000000000000000000'
              '000000000000000000000000000000000000000000000000000000000000'));
    });
  });

  group('isPrime', () {
    test('numbers <= 1', () {
      expect(isPrime(-4), false);
      expect(isPrime(-3), false);
      expect(isPrime(-1), false);
      expect(isPrime(0), false);
      expect(isPrime(1), false);
    });

    test('prime numbers', () {
      expect(isPrime(2), true);
      expect(isPrime(3), true);
      expect(isPrime(5), true);
      expect(isPrime(29), true);
      expect(isPrime(4099), true);
    });

    test('composite numbers', () {
      expect(isPrime(15), false);
      expect(isPrime(28), false);
      expect(isPrime(4097), false);
    });
  });

  test('nextPrime', () {
    expect(nextPrime(-2), 2);
    expect(nextPrime(0), 2);
    expect(nextPrime(1), 2);
    expect(nextPrime(2), 3);
    expect(nextPrime(3), 5);
    expect(nextPrime(13), 17);
    expect(nextPrime(7000), 7001);
  });
}
