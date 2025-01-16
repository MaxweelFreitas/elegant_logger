import 'package:flutter_test/flutter_test.dart';
import 'package:poc_ml/dtos/log_level.dart';
import 'package:poc_ml/helpers/draw_functions.dart';
import 'package:poc_ml/helpers/elegant_print.dart';

void main() {
  group('drawFunctions TOP ⇒', () {
    test('simple', () {
      final result = DrawFunctions.drawTop();
      eLog(result);
    });

    test('icon left', () {
      final result = DrawFunctions.drawTop(
        levelAlignment: LevelAlignment.left,
        logLevel: const LogLevel(
          icon: '🚨',
        ),
      );

      eLog(result);
    });

    test('icon right', () {
      final result = DrawFunctions.drawTop(
        levelAlignment: LevelAlignment.right,
        logLevel: const LogLevel(
          icon: '🚨',
        ),
      );

      eLog(result);
    });

    test('icon middle', () {
      final result = DrawFunctions.drawTop(
        logLevel: const LogLevel(
          icon: '🚨',
        ),
      );

      eLog(result);
    });

    test('icon + name left', () {
      final result = DrawFunctions.drawTop(
        levelAlignment: LevelAlignment.left,
        logLevel: const LogLevel(
          icon: '🚨',
          name: 'Teste',
        ),
      );

      eLog(result);
    });
    test('icon + name right', () {
      final result = DrawFunctions.drawTop(
        levelAlignment: LevelAlignment.right,
        logLevel: const LogLevel(
          icon: '🚨',
          name: 'Teste',
        ),
      );

      eLog(result);
    });
    test('icon + name middle', () {
      final result = DrawFunctions.drawTop(
        logLevel: const LogLevel(
          icon: '🚨',
          name: 'Teste',
        ),
      );

      eLog(result);
    });

    test('medium', () {
      final result = DrawFunctions.drawMedium(isDashed: true);

      eLog(result);
    });

    test('bottom', () {
      final result = DrawFunctions.drawBottom();

      eLog(result);
    });
  });
}
