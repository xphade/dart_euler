// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'dart:io';
import 'package:dart_euler/src/utilities.dart' show calculateAlphabeticalValue;

/// Returns the name score sum of all names in the file given by [path].
///
/// This is the solution to Project Euler problem 22.
///
/// The function first reads the contents of the file specified by [path]. It
/// expects a list of names, separated by commas, as it is given in the problem
/// description. It then sorts the names and calculates the alphabetical value
/// (where 'A' = 1, 'B' = 2, ...) of each one. The total score of any given name
/// is defined as the product of its position and alphabetical value. The
/// function finally returns the sum of all name scores. It asserts that the
/// file specified by [path] exists.
///
/// As an example for a name score, let's look at 'TANJA':
/// * The alphabetical value of 'TANJA' is 46 = 20 + 1 + 14 + 10 + 1
/// * It's the 4650th name in the sorted list
/// * Therefore, its name score evaluates to 46 * 4650 = 213900
int sumOfNameScores(String path) {
  final file = File(path);
  assert(file.existsSync());

  // Extract the list of names (in upper-case) from the file and sort them.
  final fileContent = file.readAsStringSync().replaceAll('"', '').toUpperCase();
  final names = fileContent.split(',')..sort();

  var sum = 0;
  for (var i = 0; i < names.length; i++) {
    final nameScore = (i + 1) * calculateAlphabeticalValue(names[i]);
    sum += nameScore;
  }
  return sum;
}
