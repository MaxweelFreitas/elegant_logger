/// A utility class for injecting and replacing text within a given string.
///
/// This class provides methods to inject text before or after specific keywords,
/// between two keywords, and also allows replacing words at specific positions
/// or replacing all occurrences of a word in the text. Regular expressions
/// can be optionally provided to customize the replacement behavior.
class InjectStr {
  /// Injects the string [toInject] before the first occurrence of [keyword].
  ///
  /// The [text] parameter is the original string where the injection will occur.
  /// If the [keyword] is found, the method returns the text with [toInject] inserted
  /// before the [keyword]. If the [keyword] is not found, the original text is returned.
  ///
  /// Example:
  /// ```
  /// String result = InjectStr.before("I love Dart!", "Dart", "Flutter");
  /// print(result); // Output: "I love Flutter Dart!"
  /// ```
  static String before(String text, String keyword, String toInject) {
    int index = text.indexOf(keyword);
    if (index == -1) {
      return text; // If keyword is not found, return original text
    }
    return text.substring(0, index) + toInject + text.substring(index);
  }

  /// Injects the string [toInject] after the first occurrence of [keyword].
  ///
  /// The [text] parameter is the original string where the injection will occur.
  /// If the [keyword] is found, the method returns the text with [toInject] inserted
  /// after the [keyword]. If the [keyword] is not found, the original text is returned.
  ///
  /// Example:
  /// ```
  /// String result = InjectStr.after("I love Dart!", "love", " and Flutter");
  /// print(result); // Output: "I love Dart and Flutter!"
  /// ```
  static String after(String text, String keyword, String toInject) {
    int index = text.indexOf(keyword);
    if (index == -1) {
      return text; // If keyword is not found, return original text
    }
    return text.substring(0, index + keyword.length) +
        toInject +
        text.substring(index + keyword.length);
  }

  /// Injects the string [toInject] between the first occurrences of [keywordBefore] and [keywordAfter].
  ///
  /// The [text] parameter is the original string where the injection will occur.
  /// The method inserts [toInject] between the first occurrence of [keywordBefore]
  /// and [keywordAfter]. If any of the keywords are not found, the original text is returned.
  ///
  /// Example:
  /// ```
  /// String result = InjectStr.between("I love Dart and Flutter.", "love", "and", "and React");
  /// print(result); // Output: "I love and React Dart and Flutter."
  /// ```
  static String between(
      String text, String keywordBefore, String keywordAfter, String toInject) {
    int startIndex = text.indexOf(keywordBefore);
    int endIndex =
        text.indexOf(keywordAfter, startIndex + keywordBefore.length);

    if (startIndex == -1 || endIndex == -1) {
      return text; // If any keyword is not found, return original text
    }

    return text.substring(0, startIndex + keywordBefore.length) +
        toInject +
        text.substring(endIndex);
  }

  /// Replaces the nth occurrence of a word in the text with a new word.
  ///
  /// The [text] parameter is the original string where the word replacement will occur.
  /// The [word] parameter is the word to replace, [newWord] is the word that will
  /// replace it, and [position] is the occurrence index to replace (starting from 0).
  /// If the word occurs more than [position] times, it will be replaced at the given index.
  ///
  /// You can optionally pass a [regex] to modify the search behavior.
  ///
  /// Example:
  /// ```
  /// String result = InjectStr.replaceAtPosition("I love Dart and Dart is great.", "Dart", "Flutter", 1);
  /// print(result); // Output: "I love Dart and Flutter is great."
  /// ```
  static String replaceAtPosition(
      String text, String word, String newWord, int position,
      {RegExp? regex}) {
    RegExp regExp = regex ?? RegExp(r'\b' + RegExp.escape(word) + r'\b');
    Iterable<Match> matches = regExp.allMatches(text);

    int count = 0;
    for (var match in matches) {
      if (count == position) {
        text = text.replaceRange(match.start, match.end, newWord);
        break;
      }
      count++;
    }
    return text;
  }

  /// Replaces all occurrences of a word in the text with a new word.
  ///
  /// The [text] parameter is the original string where the word replacement will occur.
  /// The [word] parameter is the word to replace, and [newWord] is the word that will
  /// replace all instances of [word] in the text.
  ///
  /// You can optionally pass a [regex] to modify the search behavior.
  ///
  /// Example:
  /// ```
  /// String result = InjectStr.replaceAll("I love Dart. Dart is great!", "Dart", "Flutter");
  /// print(result); // Output: "I love Flutter. Flutter is great!"
  /// ```
  static String replaceAll(String text, String word, String newWord,
      {RegExp? regex}) {
    if (word.isEmpty) {
      return text;
    }
    RegExp regExp = regex ?? RegExp(r'\b' + RegExp.escape(word) + r'\b');
    return text.replaceAll(regExp, newWord);
  }

  /// Customizes a word at a specified position in a given text by wrapping it
  /// with the provided modifiers. The customization can be applied to either a
  /// specific line or all lines in the text.
  ///
  /// - [text]: The input text to be modified.
  /// - [word]: The word to be customized.
  /// - [position]: The position of the match in the line to apply the modification to.
  /// - [modIn]: The string to be inserted before the word.
  /// - [modOut]: The string to be inserted after the word.
  /// - [line]: The line number (0-indexed) where the modification should occur. Defaults to 0.
  /// - [allLines]: If true, applies the modification to all lines. Defaults to false.
  ///
  /// Returns the modified text.
  static String customWord(
    String text,
    String word,
    int position,
    String modIn, {
    String modOut = '\x1B[0m', //resetColor
    int line = 0,
    bool allLines = false,
  }) {
    // Split the text into lines
    List<String> lines = text.split('\n');

    /// Helper function to process a single line and apply word modification.
    String processLine(String lineText, int position) {
      // Create a regular expression to match the word in the line
      RegExp regExp = RegExp(RegExp.escape(word));
      Iterable<Match> matches = regExp.allMatches(lineText);

      List<Match> matchList = matches.toList();

      // If the position is valid, apply modification to the matched word at that position
      if (matchList.isNotEmpty && position < matchList.length) {
        Match match = matchList[position];
        String customizedWord = modIn + match.group(0)! + modOut;
        lineText =
            lineText.replaceRange(match.start, match.end, customizedWord);
      }

      return lineText;
    }

    // Create a new list of lines to avoid modifying the original list
    List<String> modifiedLines = List.from(lines);

    // Apply the modification to all lines if specified, otherwise to a specific line
    if (allLines) {
      for (int i = 0; i < modifiedLines.length; i++) {
        modifiedLines[i] = processLine(modifiedLines[i], position);
      }
    } else {
      if (line >= 0 && line < modifiedLines.length) {
        // Apply modification to the specified line only
        modifiedLines[line] = processLine(modifiedLines[line], position);
      }
    }

    // Join the modified lines back into a single text string
    return modifiedLines.join('\n');
  }
}

void main() {
  // Example text
  String text = 'I love Dart, Dart is great! I also enjoy Dart.';

  // 1. Using 'before' method
  String resultBefore = InjectStr.before(text, 'Dart', 'Flutter');
  // Output: "I love Flutter Dart, Dart is great! I also enjoy Dart."
  print(resultBefore);

  // 2. Using 'after' method
  String resultAfter = InjectStr.after(text, 'love', ' and Flutter');
  // Output: "I love Dart and Flutter, Dart is great! I also enjoy Dart."
  print(resultAfter);

  // 3. Using 'between' method
  String resultBetween = InjectStr.between(text, 'love', 'and', 'and React');
  // Output: "I love and React Dart, Dart is great! I also enjoy Dart."
  print(resultBetween);

  // 4. Using 'replaceAtPosition' method with default regex
  String resultReplaceAtPosition = InjectStr.replaceAtPosition(
    text,
    'Dart',
    'Flutter',
    1,
  );
  // Output: "I love Dart, Flutter is great! I also enjoy Dart."
  print(resultReplaceAtPosition);

  // 5. Using 'replaceAtPosition' with custom regex (replace all digits with 'X')
  String textWithNumbers = 'Order 12345 and 67890';
  String resultReplaceCustomRegex = InjectStr.replaceAll(
    textWithNumbers,
    '0',
    'X',
    regex: RegExp(r'\d+'),
  );
  // Output: "Order X and X"
  print(resultReplaceCustomRegex);

  // 6. Using 'replaceAll' method with default regex
  String resultReplaceAll = InjectStr.replaceAll(text, 'Dart', 'Flutter');
  // Output: "I love Flutter, Flutter is great! I also enjoy Flutter."
  print(resultReplaceAll);
}
