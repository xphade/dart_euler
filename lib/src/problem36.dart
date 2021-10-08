import 'package:dart_euler/src/utilities.dart';

/// Returns the sum of palindromic numbers in base 2 and 10 up until [limit].
///
/// This function is the solution to Project Euler problem 36.
///
/// The function checks for all numbers in range \[1, [limit]\[ whether they are
/// palindromic in both base 2 and base 10. If that is the case, the number is
/// added to the result. The function finally returns the sum of all
/// double-base palindrome numbers. It asserts that the given [limit] is greater
/// than 1.
///
/// Example:
/// ```dart
/// // 1 == 1   ==> double-palindromic
/// // 2 == 10  ==> decimal palindrome, but no binary palindrome
/// // 3 == 11  ==> double-palindromic
/// // 4 == 100 ==> decimal palindrome, but no binary palindrome
/// doubleBasePalindromes(5) == 4 // 1 + 3
/// ```
int doubleBasePalindromes(int limit) {
  assert(limit > 1);

  var sum = 0;
  for (var i = 1; i < limit; i++) {
    final isDecimalPalindrome = isPalindromicNumber(i, base: 10);
    final isBinaryPalindrome = isPalindromicNumber(i, base: 2);
    if (isDecimalPalindrome && isBinaryPalindrome) sum += i;
  }
  return sum;
}
