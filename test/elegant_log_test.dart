import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poc_ml/dtos/log_entry_color.dart';
import 'package:poc_ml/dtos/log_entry_content.dart';
import 'package:poc_ml/elegant_log.dart';
import 'package:poc_ml/helpers/converter.dart';
import 'package:poc_ml/helpers/x_term/x_term_color.dart';
import 'package:poc_ml/helpers/x_term/x_term_style.dart';

void main() {
  test('n z log Error', () {
    final stopwatch = Stopwatch()..start();
    ElegantLog.error(
      isDated: false,
      logEntryColor: const LogEntryColor(),
      logEntryContent: const LogEntryContent(
        labelTitle: 'Title:',
        title: 'Title of my error',
        labelMessage: 'Message pasdakdsnm asd asdmasm as dasdnmasmdkaskd a dasda:',
        message: 'Lorem Ipsum is simply dummy text of the .',
        // source: r'lib\n_z_log.dart',
        linkText: 'GoogleLinkGrande',
        url:
            'https://www.google.com/search?sca_esv=c1c83ae130d39436&sxsrf=ADLYWIJd-re6y0p4FKchn5C5AJFQNIk4yg:1722989539438&q=nado+sincronizado+olimpíadas&oi=ddle&ct=348045984&hl=pt-BR&sa=X&ved=0ahUKEwjx68mbzOGHAxXhpJUCHeifNNgQPQgL&biw=1516&bih=981&dpr=1',
      ),
      isDashed: true,
      lineLength: 40,
    );

    stopwatch.stop();
    if (kDebugMode) {
      debugPrint(elapsedToHMS(stopwatch.elapsed));
    }
  });

  test('n z log a', () {
    final stopwatch = Stopwatch()..start();
    final a = drawText(
      labelColor: XTermColor.cyan,
      label: 'Comentários utilizado para facilitar o entendimento em ambiente de debug de código:',
      messageColor: XTermColor.white,
      message:
          'Lorem ipsum dolor Amet. Explicabo iusto magni consectetur casamento et perspiciatis. deleniti qui tenetur expedita. Ut omnis aperiam aut neque perferendis', // et voluptatum nulla ab harum consequatur.',
      dividerColor: XTermColor.red,
      maxCharsPerLine: 75,
    );

    stopwatch.stop();
    if (kDebugMode) {
      print(a);
      debugPrint(elapsedToHMS(stopwatch.elapsed));
    }
  });

  test('n z log b', () {
    final stopwatch = Stopwatch()..start();
    final a = drawText(
      labelColor: XTermColor.cyan,
      label: 'Comentários utilizado para facilitar o entendimento em ambiente de debug de código:',
      messageColor: XTermColor.white,
      message: removeEscapedANSI(XTermStyle.link(url: r'lib\n_z_log.dart', linkText: r'lib\n_z_log.dart')),
      dividerColor: XTermColor.red,
      maxCharsPerLine: 60,
    );

    stopwatch.stop();
    if (kDebugMode) {
      print(a);
      debugPrint(elapsedToHMS(stopwatch.elapsed));
      print(XTermStyle.link(url: r'lib\n_z_log.dart', linkText: r'lib\n_z_log.dart'));
    }
  });
}
