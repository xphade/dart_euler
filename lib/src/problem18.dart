// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

import 'dart:math' show min, max;

/// Helper class representing a vertex in the given [_triangle].
class _Vertex {
  int row;
  int col;

  _Vertex(this.row, this.col);

  factory _Vertex.root() => _Vertex(0, 0);
  factory _Vertex.left(_Vertex v) => _Vertex(v.row + 1, v.col);
  factory _Vertex.right(_Vertex v) => _Vertex(v.row + 1, v.col + 1);
}

/// The triangle given in Project Euler problem 18.
const _triangle = <List<int>>[
  /******************************/ [75],
  /****************************/ [95, 64],
  /**************************/ [17, 47, 82],
  /************************/ [18, 35, 87, 10],
  /**********************/ [20, 04, 82, 47, 65],
  /********************/ [19, 01, 23, 75, 03, 34],
  /******************/ [88, 02, 77, 73, 07, 63, 67],
  /****************/ [99, 65, 04, 28, 06, 16, 70, 92],
  /**************/ [41, 41, 26, 56, 83, 40, 80, 70, 33],
  /************/ [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
  /**********/ [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
  /********/ [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
  /******/ [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
  /****/ [63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
  /**/ [04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23]
];

/// Finds the path with the largest sum of elements and returns this sum.
///
/// This function is a recursive implementation for a simple depth-first search.
/// Starting with the given vertex [v] and the [pathSum] of the previously
/// visited vertices, the function traverses all possible paths up until the
/// [finalRow]. It calculates the sum of any of these paths and returns the
/// maximum of them.
int _findMaxPathSum(_Vertex v, int finalRow, int pathSum) {
  pathSum += _triangle[v.row][v.col];

  // Base case: Return the [pathSum] once we hit the final row.
  if (v.row == finalRow) return pathSum;

  final leftSum = _findMaxPathSum(_Vertex.left(v), finalRow, pathSum);
  final rightSum = _findMaxPathSum(_Vertex.right(v), finalRow, pathSum);
  return max(leftSum, rightSum);
}

/// Finds the maximum sum from all possible paths in a specified triangle.
///
/// This is the solution to Project Euler problem 18.
///
/// The function uses a recursive implementation of the depth-first search
/// algorithm in order to traverse all possible paths in the triangle specified
/// in problem 18. It checks every path, starting from the root up until the
/// given [finalRow]. The function asserts that [finalRow] is non-negative. If
/// [finalRow] is bigger than the height of the triangle, it traverses all
/// possible paths.
///
/// Note: Since there are 2 possible choices at each level (except the root) of
/// the given triangle, there are  `2^14 = 16384` paths to check. This is
/// computationally feasible to do. Once the triangle gets larger, we would need
/// a smarter way to solve the problem.
///
/// Example:
/// ```dart
/// // Maximum paths for the first three rows of the triangle:
/// // 1: 75, 2: 75 -> 95, 3: 75 -> 64 -> 82
/// maximumPathSum(0) == 75
/// maximumPathSum(1) == 170
/// maximumPathSum(2) == 221
/// ```
int maximumPathSum(int finalRow) {
  assert(!finalRow.isNegative);
  finalRow = min(finalRow, _triangle.length - 1);

  return _findMaxPathSum(_Vertex.root(), finalRow, 0);
}
