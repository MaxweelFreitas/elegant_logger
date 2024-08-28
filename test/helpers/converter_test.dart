import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poc_ml/helpers/converter.dart';
import 'package:poc_ml/helpers/elegant_print.dart';
import 'package:poc_ml/helpers/x_term/x_term_style.dart';

void main() {
  // test('converter ...', () {
  //   final a = Converter.hexToDec('FA');

  //   print(a);
  // });

  test('Should cleanUp all the string from ANSI scapesCode', () {
    final stopwatch = Stopwatch()..start();
    const url = r'lib\n_z_log.dart';
    const linkText = r'lib\n_z_log.dart';
    final link = XTermStyle.link(linkText: linkText, url: url);
    final result = removeEscapedANSI(link);

    stopwatch.stop();
    if (kDebugMode) {
      print(result);
      write(elapsedToHMS(stopwatch.elapsed));
    }
  });

  test('Should cleanUp all the string from ANSI scapesCode', () {
    final stopwatch = Stopwatch()..start();
    const url = r'http://www.google.com';
    const linkText = r'http://www.google.com';
    final link = XTermStyle.link(linkText: linkText, url: url);
    final result = removeEscapedANSI(link);

    stopwatch.stop();
    if (kDebugMode) {
      print(result);
      write(elapsedToHMS(stopwatch.elapsed));
    }
  });

  test('Should cleanUp all the string from ANSI scapesCode', () {
    final stopwatch = Stopwatch()..start();
    const url = r'https://www.google.com';
    const linkText = r'https://www.google.com';
    final link = XTermStyle.link(linkText: linkText, url: url);
    final result = removeEscapedANSI(link);

    stopwatch.stop();
    if (kDebugMode) {
      print(result);
      write(elapsedToHMS(stopwatch.elapsed));
    }
  });

  test('Should cleanUp all the string from ANSI scapesCode', () {
    final stopwatch = Stopwatch()..start();
    const url = r'http://google.com';
    const linkText = r'http://google.com';
    final link = XTermStyle.link(linkText: linkText, url: url);
    final result = removeEscapedANSI(link);

    stopwatch.stop();
    if (kDebugMode) {
      print(result);
      write(elapsedToHMS(stopwatch.elapsed));
    }
  });
}
