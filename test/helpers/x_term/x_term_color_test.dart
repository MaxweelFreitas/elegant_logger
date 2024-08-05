import 'package:flutter_test/flutter_test.dart';
import 'package:poc_ml/helpers/x_term/x_term_color.dart';

void main() {
  test(
      '${XTermColor.rgbFg(237, 142, 137)}█${XTermColor.rgbFg(247, 182, 133)}█${XTermColor.rgbFg(243, 235, 165)}█${XTermColor.rgbFg(148, 198, 145)}█${XTermColor.rgbFg(155, 214, 217)}█${XTermColor.rgbFg(180, 168, 224)}█${XTermColor.reset}${XTermColor.reset}   ⇒ Should return a RGB foreground color [53,55,89] ⇒ \x1B[38;2;53;55;89m██',
      () {
    final result = XTermColor.rgbFg(53, 55, 89);
    expect(result, '\x1B[38;2;53;55;89m');
  });

  test(
      '${XTermColor.rgbBg(237, 142, 137)}.${XTermColor.rgbBg(247, 182, 133)}.${XTermColor.rgbBg(243, 235, 165)}.${XTermColor.rgbBg(148, 198, 145)}.${XTermColor.rgbBg(155, 214, 217)}.${XTermColor.rgbBg(180, 168, 224)}.${XTermColor.reset}${XTermColor.reset}   ⇒ Should return a RGB background color [53,55,89] ⇒ \x1B[48;2;53;55;89m..',
      () {
    final result = XTermColor.rgbBg(53, 55, 89);
    expect(result, '\x1B[48;2;53;55;89m');
  });

  group('${XTermColor.std256FG(206)}std256FG${XTermColor.reset} ⇒', () {
    test('Should return the color std256FG   ⇒ \x1B[38;5;206m██\x1B[0m', () {
      final result = XTermColor.std256FG(206);
      expect(result, '\x1B[38;5;206m');
    });

    test(
        'Should return failure when trying to pass the wrong red   value parameter < 0',
        () {
      final result = XTermColor.std256FG(-1);
      expect(
          result, 'std256FG color is invalid! [needs to be Grater and then 0]');
    });

    test(
        'Should return failure when trying to pass the wrong red   value parameter > 255',
        () {
      final result = XTermColor.std256FG(300);
      expect(result, 'std256FG color is invalid![needs to be less than 256]');
    });
  });

  group('${XTermColor.std256BG(206)}std256BG${XTermColor.reset} ⇒', () {
    test('Should return the color std256BG   ⇒ \x1B[48;5;206m..', () {
      final result = XTermColor.std256BG(206);
      expect(result, '\x1B[48;5;206m');
    });

    test(
        'Should return failure when trying to pass the wrong red   value parameter < 0',
        () {
      final result = XTermColor.std256BG(-1);
      expect(
          result, 'std256BG color is invalid! [needs to be Grater and then 0]');
    });

    test(
        'Should return failure when trying to pass the wrong red   value parameter > 255',
        () {
      final result = XTermColor.std256BG(300);
      expect(result, 'std256BG color is invalid![needs to be less than 256]');
    });
  });

  group('${XTermColor.red}RED${XTermColor.reset}      ⇒', () {
    test(
        'Should return failure when trying to pass the wrong red   value parameter < 0',
        () {
      final result = XTermColor.rgbFg(-5, 220, 150);
      expect(result, 'Red color is invalid! [needs to be Grater and then 0]');
    });

    test(
        'Should return failure when trying to pass the wrong red   value parameter > 255',
        () {
      final result = XTermColor.rgbFg(500, 220, 150);
      expect(result, 'Red color is invalid![needs to be less than 256]');
    });
  });

  group('${XTermColor.green}GREEN${XTermColor.reset}    ⇒', () {
    test(
        'Should return failure when trying to pass the wrong green value parameter < 0',
        () {
      final result = XTermColor.rgbFg(220, -5, 150);
      expect(result, 'Green color is invalid! [needs to be Grater and then 0]');
    });

    test(
        'Should return failure when trying to pass the wrong green value parameter > 255',
        () {
      final result = XTermColor.rgbFg(220, 500, 150);

      expect(result, 'Green color is invalid![needs to be less than 256]');
    });
  });

  group('${XTermColor.blue}BLUE${XTermColor.reset}     ⇒', () {
    test(
        'Should return failure when trying to pass the wrong blue  value parameter < 0',
        () {
      final result = XTermColor.rgbFg(220, 150, -5);
      expect(result, 'Blue color is invalid! [needs to be Grater and then 0]');
    });

    test(
        'Should return failure when trying to pass the wrong blue  value parameter > 255',
        () {
      final result = XTermColor.rgbFg(220, 150, 500);
      expect(result, 'Blue color is invalid![needs to be less than 256]');
    });
  });
}
