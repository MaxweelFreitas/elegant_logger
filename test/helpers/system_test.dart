import 'package:flutter_test/flutter_test.dart';
import 'package:poc_ml/helpers/converter.dart';
import 'package:poc_ml/helpers/system.dart';
import 'package:poc_ml/helpers/x_term/x_term_color.dart';

void main() {
  test('📂 ${XTermColor.green}getFileName', () async {
    String fileName;
    try {
      throw ArgumentError('Invalid argument');
    } catch (e, stacktrace) {
      fileName = System.getFileName(stacktrace);
    }

    expect(removeEscapedANSI(fileName), '📂 File name: 📄 system_test.dart');
  });

  test('🗃️ ${XTermColor.green}getStackTraceLinks', () async {
    List<String> resultLinks;
    try {
      throw ArgumentError('Invalid argument');
    } catch (e, stacktrace) {
      resultLinks = System.getStackTraceLinks(stacktrace);
    }

    expect(
      resultLinks,
      [
        'test/helpers/system_test.dart:21:7',
        'lib/src/backend/declarer.dart:215:19',
        'lib/src/backend/declarer.dart:213:7',
        'lib/src/backend/invoker.dart:258:9',
      ],
    );
  });
}
