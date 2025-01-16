import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:poc_ml/helpers/elegant_json.dart';
import 'package:poc_ml/helpers/elegant_print.dart';
import 'package:poc_ml/helpers/x_term/x_term_color.dart';

void main() {
  test('elegant json ...', () async {
    String exampleJsonString = jsonEncode(
      {
        'user': {
          'id': 12345,
          'name': 'Alice Johnson',
          'email': 'alice.johnson@example.com',
          'address': {
            'street': '123 Elm Street',
            'number': '24B',
            'city': 'Metropolis',
            'zipcode': '12345'
          },
          'active': true,
          'roles': ['admin', 'user']
        }
      },
    );

    final result = ElegantJson.print(
      jsonString: exampleJsonString,
      lineLength: 50,
      dividerColor: XTermColor.red,
      keyColor: XTermColor.green,
      valueColor: XTermColor.magenta,
    );

    eLog(result);
  });
}
