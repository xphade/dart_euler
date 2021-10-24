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

  group('isPalindrome', () {
    test('case-sensitive', () {
      expect(isPalindrome(''), false);
      expect(isPalindrome('dart'), false);
      expect(isPalindrome('racecar'), true);
      expect(isPalindrome('Racecar'), false);
      expect(isPalindrome('RaCeCaR'), true);
      expect(isPalindrome('step on no pets'), true);
      expect(isPalindrome('Step on no Pets'), false);
    });

    test('case-insensitive', () {
      expect(isPalindrome('', ignoreCase: true), false);
      expect(isPalindrome('Euler', ignoreCase: true), false);
      expect(isPalindrome('Level', ignoreCase: true), true);
      expect(isPalindrome('roTOR', ignoreCase: true), true);
      expect(isPalindrome('Rats Live on no Evil Star', ignoreCase: true), true);
    });
  });

  group('isPalindromicNumber', () {
    test('decimal', () {
      expect(isPalindromicNumber(-1), false);
      expect(isPalindromicNumber(1), true);
      expect(isPalindromicNumber(24), false);
      expect(isPalindromicNumber(33), true);
      expect(isPalindromicNumber(12345), false);
      expect(isPalindromicNumber(2648462), true);
    });
    test('binary', () {
      expect(isPalindromicNumber(int.parse('1', radix: 2), base: 2), true);
      expect(isPalindromicNumber(int.parse('10', radix: 2), base: 2), false);
      expect(isPalindromicNumber(int.parse('11', radix: 2), base: 2), true);
      expect(isPalindromicNumber(int.parse('100', radix: 2), base: 2), false);
      expect(isPalindromicNumber(int.parse('101', radix: 2), base: 2), true);
      expect(
          isPalindromicNumber(int.parse('11101101', radix: 2), base: 2), false);
      expect(
          isPalindromicNumber(int.parse('10100101', radix: 2), base: 2), true);
    });
    test('hexadecimal', () {
      expect(isPalindromicNumber(0x1, base: 16), true);
      expect(isPalindromicNumber(0xB, base: 16), true);
      expect(isPalindromicNumber(0xC4, base: 16), false);
      expect(isPalindromicNumber(0xDD, base: 16), true);
      expect(isPalindromicNumber(0x1F356, base: 16), false);
      expect(isPalindromicNumber(0xE535E, base: 16), true);
    });
  });

  test('isPerfectSquare', () {
    expect(isPerfectSquare(-4), false);
    expect(isPerfectSquare(-1), false);
    expect(isPerfectSquare(0), true); // 0 * 0
    expect(isPerfectSquare(1), true); // 1 * 1
    expect(isPerfectSquare(4), true); // 2 * 2
    expect(isPerfectSquare(25), true); // 5  * 5
    expect(isPerfectSquare(225), true); // 15 * 15
    expect(isPerfectSquare(1764), true); // 42 * 42
    expect(isPerfectSquare(6), false);
    expect(isPerfectSquare(17), false);
    expect(isPerfectSquare(420), false);
    expect(isPerfectSquare(2100), false);
  });

  group('getDivisors', () {
    test('numbers < 2', () {
      expect(() => getDivisors(-5), throwsAssertion);
      expect(() => getDivisors(-4), throwsAssertion);
      expect(() => getDivisors(-1), throwsAssertion);
      expect(() => getDivisors(0), throwsAssertion);
      expect(getDivisors(1), [1]);
    });
    test('composite numbers', () {
      expect(getDivisors(4)..sort(), [1, 2, 4]);
      expect(getDivisors(9)..sort(), [1, 3, 9]);
      expect(getDivisors(15)..sort(), [1, 3, 5, 15]);
      expect(getDivisors(28)..sort(), [1, 2, 4, 7, 14, 28]);
      expect(getDivisors(100)..sort(), [1, 2, 4, 5, 10, 20, 25, 50, 100]);
    });
    test('prime numbers', () {
      expect(getDivisors(2), [1, 2]);
      expect(getDivisors(3), [1, 3]);
      expect(getDivisors(17), [1, 17]);
      expect(getDivisors(101), [1, 101]);
    });
    test('sorted', () {
      expect(getDivisors(8), [1, 8, 2, 4]);
      expect(getDivisors(8, sorted: false), [1, 8, 2, 4]);
      expect(getDivisors(8, sorted: true), [1, 2, 4, 8]);
      expect(getDivisors(13, sorted: false), [1, 13]);
      expect(getDivisors(13, sorted: true), [1, 13]);
    });
  });

  group('calculateAlphabeticalValue', () {
    test('upperCase', () {
      expect(calculateAlphabeticalValue(''), 0);
      expect(calculateAlphabeticalValue('A'), 1);
      expect(calculateAlphabeticalValue('DART'), 43);
    });
    test('lowerCase', () {
      expect(calculateAlphabeticalValue('', upperCase: false), 0);
      expect(calculateAlphabeticalValue('a', upperCase: false), 1);
      expect(calculateAlphabeticalValue('dart', upperCase: false), 43);
    });
    test('convert', () {
      expect(calculateAlphabeticalValue('', convert: true), 0);
      expect(calculateAlphabeticalValue('A', convert: true), 1);
      expect(calculateAlphabeticalValue('DaRt', convert: true), 43);
      expect(
          calculateAlphabeticalValue('dArT', upperCase: false, convert: true),
          43);
    });
  });
}
