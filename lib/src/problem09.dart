import 'dart:math' show pow, sqrt;

/// Helper class to return the result of [specialPythagoreanTriplet].
class SPTResult {
  final int a, b, c;
  SPTResult(this.a, this.b, this.c);
  int get product => a * b * c;
}

/// Returns the product of a special pythagorean triplet.
///
/// This is the solution to Project Euler problem 9.
///
/// A Pythagorean triplet is a set of three natural numbers with the following
/// properties:
/// * `a < b < c`
/// * `a^2 + b^2 = c^2`
///
/// This function tries to find the special Pythagorean triplet where `a + b +
/// c` equals the given [sum]. If such a triplet exists, the function returns
/// a result object of type [SPTResult]. Otherwise it returns `null`. The given
/// [sum] must be at least 6.
///
/// Example:
/// ```dart
/// // a = 6, b = 8, c = 10
/// // 6 + 8 + 10 == 24, 6^2 + 8^2 = 100 = 10^2
/// specialPythagoreanTriplet(24) == 480  // Triplet exists, return 6 * 8 * 10.
/// specialPythagoreanTriplet(25) == null // No such triplet.
/// ```
SPTResult? specialPythagoreanTriplet(int sum) {
  // The smallest possible sum is 1 + 2 + 3 = 6.
  assert(sum >= 6);

  // If `a = sum/3` or `b = sum/2` then `a + b + c > 1000`, so we can stop.
  final limitA = sum ~/ 3;
  final limitB = sum ~/ 2;

  for (var a = 1; a < limitA; a++) {
    for (var b = a + 1; b < limitB; b++) {
      if (a + b + b + 1 > sum) break;

      // Since `a^2 + b^2 = c^2` and `a + b + c = sum`, the solution must
      // fulfill the following condition: `a^2 + b^2 == (sum - (a + b))^2`
      final lhs = pow(a, 2) + pow(b, 2) as int;
      final rhs = pow(sum - (a + b), 2) as int;

      if (lhs == rhs) {
        final c = sqrt(pow(a, 2) + pow(b, 2)).toInt();
        return SPTResult(a, b, c);
      }
    }
  }
}
