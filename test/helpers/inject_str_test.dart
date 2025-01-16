import 'package:flutter_test/flutter_test.dart';
import 'package:poc_ml/helpers/inject_str.dart';
import 'package:poc_ml/helpers/x_term/x_term_color.dart';

void main() {
  group('InjectStr Failure Cases', () {
    String text = 'I love Dart, Dart is great! I also enjoy Dart.';

    test('before method with non-existing substring', () {
      String result = InjectStr.before(text, 'Python', 'Flutter ');
      expect(result, text);
    });

    test('after method with non-existing substring', () {
      String result = InjectStr.after(text, 'Python', ' and Flutter');
      expect(result, text);
    });

    test('between method with non-existing substrings', () {
      String result =
          InjectStr.between(text, 'Python', 'JavaScript', ' and React');
      expect(result, text);
    });

    test('replaceAtPosition method with out-of-bound position', () {
      String result = InjectStr.replaceAtPosition(text, 'Dart', 'Flutter', 5);
      expect(result, text);
    });

    test('replaceAtPosition method with negative position', () {
      String result = InjectStr.replaceAtPosition(text, 'Dart', 'Flutter', -1);
      expect(result, text);
    });

    test('replaceAtPosition method with non-existing substring', () {
      String result = InjectStr.replaceAtPosition(text, 'Python', 'Flutter', 1);
      expect(result, text);
    });

    test('replaceAll method with non-existing substring', () {
      String result = InjectStr.replaceAll(text, 'Python', 'Flutter');
      expect(result, text);
    });

    test('replaceAll method with empty replacement', () {
      String result = InjectStr.replaceAll(text, 'Dart', '');
      expect(result, 'I love ,  is great! I also enjoy .');
    });

    // Test to ensure the function doesn't crash with empty target string
    test('replaceAll method with empty target string', () {
      String result = InjectStr.replaceAll(text, '', 'Flutter');
      expect(result, text);
    });
  });

  test(
    'description',
    () {
      String textoColorido =
          'I love Dart, Dart is great! I also enjoy Dart.\nI love Dart, Dart is great! I also enjoy Dart.';

      // Aplica a modificação na primeira ocorrência de 'I' (vermelho)
      textoColorido = InjectStr.customWord(
        textoColorido, // Passando o texto já modificado
        'love',
        0, // Aplica na primeira ocorrência de 'I'
        XTermColor.red,
        // line: 1, // Aplica apenas na linha 0
        // allLines: true, // Aplica em todas as linhas
      );

      // Aplica a modificação na segunda ocorrência de 'I' (verde)
      textoColorido = InjectStr.customWord(
        textoColorido, // Passando o texto já modificado
        'I',
        1, // Aplica na segunda ocorrência de 'I'
        XTermColor.green,

        line: 1, // Aplica apenas na linha 0
        allLines: true, // Aplica em todas as linhas
      );

      print(textoColorido);
    },
  );

  group(
      '📝${InjectStr.customWord(
        ' customWord',
        'customWord',
        0,
        XTermColor.blueBright,
      )}', () {
    test('✅: Customize word in a specific line', () {
      String text = 'This is a test.\nAnother test line.';
      String word = 'test';
      int position = 0;
      String modIn = '[';
      String modOut = ']';
      int line = 0;

      // Applying customization to the first line
      String result = InjectStr.customWord(text, word, position, modIn,
          modOut: modOut, line: line);

      // Verify the word in the first line is modified
      expect(result, equals('This is a [test].\nAnother test line.'));
    });

    test('✅: Customize word in all lines', () {
      String text = 'This is a test.\nAnother test line.';
      String word = 'test';
      int position = 0;
      String modIn = '[';
      String modOut = ']';
      bool allLines = true;

      // Applying customization to all lines
      String result = InjectStr.customWord(
        text,
        word,
        position,
        modIn,
        modOut: modOut,
        allLines: allLines,
      );

      // Verify the word in both lines is modified
      expect(result, equals('This is a [test].\nAnother [test] line.'));
    });

    test('❎: Position out of bounds', () {
      String text = 'This is a test.\nAnother test line.';
      String word = 'test';
      int position =
          2; // Invalid position (there are only 2 occurrences of 'test' in the text)
      String modIn = '[';
      String modOut = ']';
      int line = 0;

      // Attempt to modify a non-existent position
      String result = InjectStr.customWord(
        text,
        word,
        position,
        modIn,
        modOut: modOut,
        line: line,
      );

      // The result should be unchanged because the position is out of bounds
      expect(result, equals('This is a test.\nAnother test line.'));
    });

    test('❎: Line index out of bounds', () {
      String text = 'This is a test.\nAnother test line.';
      String word = 'test';
      int position = 0;
      String modIn = '[';
      String modOut = ']';
      int line = 5; // Invalid line number

      // Attempt to modify a line that doesn't exist
      String result = InjectStr.customWord(
        text,
        word,
        position,
        modIn,
        modOut: modOut,
        line: line,
      );

      // The result should be unchanged because the line index is out of bounds
      expect(result, equals('This is a test.\nAnother test line.'));
    });

    test('✅: No match found for word', () {
      String text = 'This is a simple line.\nAnother line here.';
      String word = 'test'; // No 'test' word in the text
      int position = 0;
      String modIn = '[';
      String modOut = ']';
      int line = 0;

      // Attempt to modify a word that doesn't exist in the text
      String result = InjectStr.customWord(
        text,
        word,
        position,
        modIn,
        modOut: modOut,
        line: line,
      );

      // The result should be unchanged because the word was not found
      expect(result, equals('This is a simple line.\nAnother line here.'));
    });
  });
}
