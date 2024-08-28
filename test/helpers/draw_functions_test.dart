import 'package:flutter_test/flutter_test.dart';
import 'package:poc_ml/dtos/log_level.dart';
import 'package:poc_ml/helpers/draw_functions.dart';
import 'package:poc_ml/helpers/elegant_print.dart';

void main() {
  group('drawFunctions TOP ⇒', () {
    test('simple', () {
      final result = DrawFunctions.drawTop();
      write(result);
    });

    test('icon left', () {
      final result = DrawFunctions.drawTop(
        levelAlignment: LevelAlignment.left,
        logLevel: const LogLevel(
          icon: '🚨',
        ),
      );

      write(result);
    });

    test('icon right', () {
      final result = DrawFunctions.drawTop(
        levelAlignment: LevelAlignment.right,
        logLevel: const LogLevel(
          icon: '🚨',
        ),
      );

      write(result);
    });

    test('icon middle', () {
      final result = DrawFunctions.drawTop(
        logLevel: const LogLevel(
          icon: '🚨',
        ),
      );

      write(result);
    });

    test('icon + name left', () {
      final result = DrawFunctions.drawTop(
        levelAlignment: LevelAlignment.left,
        logLevel: const LogLevel(
          icon: '🚨',
          name: 'Teste',
        ),
      );

      write(result);
    });
    test('icon + name right', () {
      final result = DrawFunctions.drawTop(
        levelAlignment: LevelAlignment.right,
        logLevel: const LogLevel(
          icon: '🚨',
          name: 'Teste',
        ),
      );

      write(result);
    });
    test('icon + name middle', () {
      final result = DrawFunctions.drawTop(
        logLevel: const LogLevel(
          icon: '🚨',
          name: 'Teste',
        ),
      );

      write(result);
    });

    test('medium', () {
      final result = DrawFunctions.drawMedium(isDashed: true);

      write(result);
    });

    test('bottom', () {
      final result = DrawFunctions.drawBottom();

      write(result);
    });
  });
}
