import 'package:flutter_test/flutter_test.dart';
import 'package:poc_ml/helpers/x_term/x_term_color.dart';
import 'package:poc_ml/n_z_log.dart';

void main() {
  test('n z log Error', () {
    NZLog.error(
        title: 'Title of my error log test ',
        source: r'C:\flutter_proj\poc_ml\lib\n_z_log.dart',
        linkText: 'Google',
        url: 'https://www.google.com',
        isDashed: true,
        msg:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.');
  });

  test('n z log Warning', () {
    NZLog.warning(
        title: 'Title of my error log test',
        source: r'lib\n_z_log.dart',
        isDashed: true,
        msg:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.');
  });

  test('n z log Info', () {
    NZLog.info(
        title: 'Title of my error log test',
        source: r'lib\n_z_log.dart',
        isDashed: true,
        msg:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.');
  });

  test('n z log Debug', () {
    NZLog.debug(
        title: 'Title of my error log test',
        source: r'lib\n_z_log.dart',
        isDashed: true,
        msg:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.');
  });

  test('n z log a', () {
    final a = line(
      divider: '|',
      labelColor: XTermColor.blue,
      label: 'Comentários utilizado para facilitar o entendimento em ambiente de debug de código:',
      messageColor: XTermColor.white,
      message:
          'Lorem ipsum dolor Amet. Explicabo iusto magni consectetur casamento et perspiciatis. deleniti qui tenetur expedita. Ut omnis aperiam aut neque perferendis', // et voluptatum nulla ab harum consequatur.',
      dividerColor: XTermColor.red,
      maxCharsPerLine: 60,
    );
    print(a);
  });
}
