// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

/// The possible steps to take.
enum _Step { right, down, left, up }

/// Returns the next step after the [currentStep].
_Step _nextStep(_Step currentStep) {
  final nextIndex = (currentStep.index + 1) % _Step.values.length;
  return _Step.values[nextIndex];
}

/// Generates a [n]x[n] matrix where the numbers are arranged as a spiral.
///
/// Generates a list of list (of size [n]x[n]) filled with consecutive numbers
/// aranged in a spiral. The spiral starts with 1, initially moves to the
/// right and continues in a clock-wise fashion.
///
/// Example:
/// ```dart
/// final spiral = _generateNumberSpiral(3);
/// for (final row in spiral) {
///   print(row);
/// }
/// // Output:
/// // [7, 8, 9]
/// // [6, 1, 2]
/// // [5, 4, 3]
/// ```
List<List<int>> _generateNumberSpiral(int n) {
  // Generate an empty matrix of size n x n.
  final spiral = List.generate(n, (idx) => List.filled(n, 0));

  // Start in the middle of the spiral (upper-left in case of an even number).
  var row = n ~/ 2;
  if (n.isEven) row--;
  var col = row;

  // Initially go one step to the right.
  var currentStep = _Step.right;
  var stepsToGo = 1;
  var stepsTaken = 0;

  var currentNumber = 1;

  while (row >= 0 && row < n && col >= 0 && col < n) {
    spiral[row][col] = currentNumber++;

    if (currentStep == _Step.right) {
      col++;
    } else if (currentStep == _Step.down) {
      row++;
    } else if (currentStep == _Step.left) {
      col--;
    } else {
      row--; // currentStep == _Step.up
    }

    if (++stepsTaken == stepsToGo) {
      currentStep = _nextStep(currentStep);
      stepsTaken = 0;
    }

    // At the diagonal, we have to increase the number of steps to go.
    if (row == col) stepsToGo++;
  }

  return spiral;
}

/// Generates a number spiral and returns the sum of numbers on the diagonals.
///
/// This is the solution to Project Euler problem 28.
///
/// The function first generates a quadratic 2d matrix of the given [size]. The
/// matrix elements are filled as a number spiral: Starting with 1 and moving to
/// the right in a clock-wise direction, a spiral of consecutive numbers is
/// formed. The function then calculates the sum of numbers on the diagonals of
/// the matrix. It asserts that the given [size] is at least one. Note that if
/// the [size] is odd, the center element will only be counted once.
///
/// Example:
/// ```dart
/// // Number spiral of size 3:
/// // 7  8  9
/// // 6  1  2 ==> Sum of diagonals: 7 + 1 + 3 + 5 + 9 = 25
/// // 5  4  3
/// sumOfSpiralDiagonals(3) == 25;
/// ```
int sumOfSpiralDiagonals(int size) {
  assert(size >= 1);

  final spiral = _generateNumberSpiral(size);

  var sum = 0;
  var j = 0;
  var k = spiral.length - 1;

  for (var i = 0; i < spiral.length; i++) {
    if (j != k) {
      sum += spiral[i][j++] + spiral[i][k--];
    } else {
      // Do not count the middle cell twice.
      sum += spiral[i][j++];
      k--;
    }
  }

  return sum;
}
