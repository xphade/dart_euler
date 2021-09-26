/// Computes the Collatz sequence starting from [startValue].
List<int> _collatz(int startValue) {
  var sequence = <int>[startValue];
  var value = startValue;

  while (value != 1) {
    value = value.isEven ? value ~/ 2 : 3 * value + 1;
    sequence.add(value);
  }

  return sequence;
}

/// Helper class to return the result of the [longestCollatzSequence] function.
class LCSResult {
  final int longestChainNumber;
  final int maxChainLength;
  LCSResult(this.longestChainNumber, this.maxChainLength);
}

/// Finds the longest Collatz sequence of all start values from 1 to [limit].
///
/// This is the solution to Project Euler problem 14.
///
/// The function calculates the Collatz sequence for all start values in range
/// \[1, limit]. It then returns the number producing the longest chain with its
/// corresponding length.
///
/// The Collatz sequence is defined as
/// * `n -> n/2`    if `n` is even
/// * `n -> 3n + 1` if `n` is odd
///
/// The function asserts that the given [limit] is a positive integer.
LCSResult longestCollatzSequence(int limit) {
  assert(limit > 0);

  var maxChainLength = 0;
  var longestChainNumber = 0;

  for (var i = 1; i < limit; i++) {
    final sequence = _collatz(i);

    if (sequence.length > maxChainLength) {
      maxChainLength = sequence.length;
      longestChainNumber = i;
    }
  }

  return LCSResult(longestChainNumber, maxChainLength);
}
