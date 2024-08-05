import 'package:flutter_test/flutter_test.dart';
import 'package:poc_ml/helpers/converter.dart';

void main() {
  test('converter ...', () {
    final a = Converter.hexToDec('FA');

    print(a);
  });
}
