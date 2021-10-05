// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'dart:math' show max;

/// The large number specified for Project Euler problem 8.
const _largeNumber = '73167176531330624919225119674426574742355349194934'
    '96983520312774506326239578318016984801869478851843'
    '85861560789112949495459501737958331952853208805511'
    '12540698747158523863050715693290963295227443043557'
    '66896648950445244523161731856403098711121722383113'
    '62229893423380308135336276614282806444486645238749'
    '30358907296290491560440772390713810515859307960866'
    '70172427121883998797908792274921901699720888093776'
    '65727333001053367881220235421809751254540594752243'
    '52584907711670556013604839586446706324415722155397'
    '53697817977846174064955149290862569321978468622482'
    '83972241375657056057490261407972968652414535100474'
    '82166370484403199890008895243450658541227588666881'
    '16427171479924442928230863465674813919123162824586'
    '17866458359124566529476545682848912883142607690042'
    '24219022671055626321111109370544217506941658960408'
    '07198403850962455444362981230987879927244284909188'
    '84580156166097919133875499200524063689912560717606'
    '05886116467109405077541002256983155200055935729725'
    '71636269561882670428252483600823257530420752963450';

/// Determines the largest product computed from n adjacent [digits].
///
/// This is the solution to Project Euler problem 8.
///
/// Based on the 1000-digit number specified in Project Euler problem 8, this
/// function considers all subsets with the given amount of adjacent [digits].
/// For each subset, it calculates the product of the digits and finally returns
/// the largest of them.
///
/// The given [digits] must be at least 2 and at most the size of the large
/// number (1000).
///
/// Examples:
/// ```dart
/// largestProductInSeries(2) == 81   // 9 * 9
/// largestProductInSeries(4) == 5832 // 9 * 9 * 8 * 9
/// ```
int largestProductInSeries(int digits) {
  assert(digits >= 2);
  assert(digits <= _largeNumber.length);

  int largestProduct = 0;

  for (var i = 0; (i + digits) <= _largeNumber.length; i++) {
    final subset = _largeNumber.substring(i, i + digits);

    // If there is at least one 0, the result must be 0 as well.
    if (subset.contains('0')) continue;

    final product = subset.runes
        .map((rune) => int.parse(String.fromCharCode(rune)))
        .fold(1, (int previousValue, int element) => previousValue * element);
    largestProduct = max(largestProduct, product);
  }

  return largestProduct;
}
