// Copyright (c) 2021, xphade
// SPDX-License-Identifier: MIT

/// Counts the number of lattice paths in a quadratic grid of the given [size].
///
/// This is the solution to Project Euler problem 15.
///
/// The function counts the total number of lattice path in a quadratic grid
/// with the given [size]. It asserts that the grid [size] is at least 1.
///
/// A lattice path is defined as a route passing through a grid of horizontal
/// and vertical lines, starting from the origin (upper-left cell) and arriving
/// at the destination (lower-right cell) by only travelling down or right. As
/// an example, in a grid of size 2x2, there are 3 * 3 = 9 lattice points
/// (grid line intersections). For this grid, there exist 6 possible paths to
/// arrive at the destination.
///
/// The presented solution is using a Dynamic Programming approach, calculating
/// the possible lattice paths for each cell of the grid by combining the values
/// of its neighboring cells.
///
/// Examples:
/// ```dart
/// countLatticePaths(1) == 2 // Two routes: right->down and down->right.
/// countLatticePaths(2) == 6
/// ```
int countLatticePaths(int size) {
  assert(size >= 1);

  // Generate a grid of size (n+1)x(n+1) and fill it with 1s.
  final vertices = size + 1;
  final grid = List.generate(vertices, (index) => List.filled(vertices, 1));

  for (var row = 1; row < vertices; row++) {
    for (var col = 1; col < vertices; col++) {
      // Skip the first row and column. Every other cell must now be the sum of
      // its top and left neighbors.
      grid[row][col] = grid[row - 1][col] + grid[row][col - 1];
    }
  }

  // The lower right cell now contains the total number of lattice paths.
  return grid[vertices - 1][vertices - 1];
}
