/// Creates the word representation of a single-[digit] number.
String _createSingleDigitWord(int digit) {
  assert(digit >= 0 && digit <= 9);

  const words = <String>[
    '',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine'
  ];
  return words[digit];
}

/// Creates the word representation of a 2-digit number given by the arguments.
String _createTwoDigitWord(int tensDigit, int singlesDigit) {
  assert(tensDigit >= 1 && tensDigit <= 9);
  assert(singlesDigit >= 0 && singlesDigit <= 9);

  /// Special case: 10-19 are irregular.
  if (tensDigit == 1) {
    const words = <String>[
      'ten',
      'eleven',
      'twelve',
      'thirteen',
      'fourteen',
      'fifteen',
      'sixteen',
      'seventeen',
      'eighteen',
      'nineteen'
    ];
    return words[singlesDigit];
  }

  const words = <String>[
    'twenty',
    'thirty',
    'forty',
    'fifty',
    'sixty',
    'seventy',
    'eighty',
    'ninety'
  ];

  var word = words[tensDigit - 2];
  if (singlesDigit != 0) {
    word += '-' + _createSingleDigitWord(singlesDigit);
  }
  return word;
}

/// Creates the word representation of a 3-digit number given by the arguments.
String _createThreeDigitWord(
    int hundredsDigit, int tensDigit, int singlesDigit) {
  assert(hundredsDigit >= 1 && tensDigit <= 9);
  assert(tensDigit >= 0 && tensDigit <= 9);
  assert(singlesDigit >= 0 && singlesDigit <= 9);

  var word = _createSingleDigitWord(hundredsDigit) + ' hundred';

  // Early return for the raw hundred values.
  if (singlesDigit == 0 && tensDigit == 0) return word;

  word += ' and ';
  if (tensDigit == 0) {
    word += _createSingleDigitWord(singlesDigit);
  } else {
    word += _createTwoDigitWord(tensDigit, singlesDigit);
  }
  return word;
}

/// Generates the word representation of the given [number].
String _generateNumberWord(int number) {
  assert(number >= 1 && number <= 1000);

  /// Early return for the special case of 1000.
  if (number == 1000) return 'one thousand';

  // Example: 837 ==> [singlesDigit] = 7, [tensDigit] = 3, [hundredsDigit] = 8.
  final singlesDigit = (number % 100) % 10;
  final tensDigit = (number % 100) ~/ 10;
  final hundredsDigit = number ~/ 100;

  String word;
  if (hundredsDigit != 0) {
    word = _createThreeDigitWord(hundredsDigit, tensDigit, singlesDigit);
  } else if (tensDigit != 0) {
    word = _createTwoDigitWord(tensDigit, singlesDigit);
  } else {
    word = _createSingleDigitWord(singlesDigit);
  }
  return word;
}

/// Counts the letters of all numbers between [start] and [stop].
///
/// This is the solution to Project Euler problem 17.
///
/// This function counts the letters of all numbers in range [[start], [stop]]
/// written as words. Spaces and hyphens are excluded from the count. The
/// function asserts that [start] is at least 1, [stop] is at most 1000 and
/// [start] is smaller or equal to [stop].
///
/// Examples:
/// ```dart
/// // one, two, three, four, five ==> 3 + 3 + 5 + 4 + 4
/// numberLetterCounts(1, 5) == 15
///
/// // ninety-nine, one hundred, one hundred and one ==> 10 + 10 + 16
/// numberLetterCounts(99, 101) == 36
/// ```
int numberLetterCounts(int start, int stop) {
  assert(start >= 1 && stop >= start && stop <= 1000);

  var sum = 0;

  for (var number = start; number <= stop; number++) {
    final word = _generateNumberWord(number);
    final wordLength = word.runes
        .map((rune) => String.fromCharCode(rune))
        .where((char) => char != ' ' && char != '-')
        .length;

    sum += wordLength;
  }

  return sum;
}
