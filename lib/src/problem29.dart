import 'package:dart_euler/src/utilities.dart' show pow;

/// Calculates the number of distinct powers.
///
/// The function computes all integer combinations of `a^b` for a, b in range
/// [[low], [high]]. It then returns the number of distinct terms in this
/// sequence.
///
/// The function asserts that [low] and [high] are positive integers and [low]
/// is smaller than [high].
///
/// Example:
/// * [low] == 1, [high] == 2
/// * `1^1 = 1`, `1^2 = 1`, `2^1 = 2`, `2^2 = 4`
/// * 3 distinct terms: `distinctPowers(1, 2) == 3`
int distinctPowers(int low, int high) {
  assert(low > 0 && high > 0);
  assert(low < high);

  var powers = <BigInt>{};

  for (var a = low; a <= high; a++) {
    for (var b = low; b <= high; b++) {
      powers.add(pow(a, b));
    }
  }

  return powers.length;
}
