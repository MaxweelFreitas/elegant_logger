import 'package:flutter_test/flutter_test.dart';
import 'package:poc_ml/helpers/elegant_print.dart';
import 'package:poc_ml/helpers/x_term/x_term_color.dart';

void main() {
  test('should write a text in terminal', () {
    write(XTermColor.red + 'teste' + XTermColor.reset);
  });
}
