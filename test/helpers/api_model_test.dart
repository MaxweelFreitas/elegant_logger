import 'package:flutter_test/flutter_test.dart';
import 'package:poc_ml/helpers/inject_str.dart';

void main() {
  test('api model ...', () {
    print('''
[2025-01-16 14:23:45] [INFO] [API Consumption]
---------------------------------------------------------------------------
Request:
  - Method:        POST
  - URL:           /api/v1/users
  - IP:            192.168.1.10
  - User-Agent:    Mozilla/5.0 (Windows NT 10.0; Win64; x64)
  - Auth User ID:  12345
  - Headers:       {"Authorization": "Bearer xyz", "Content-Type": "application/json"}
  - Parameters:    {"name": "John Doe", "email": "john@example.com"}

Response:
  - Status Code:   201 Created
  - Time Taken:    150ms
  - Headers:       {"Content-Type": "application/json"}
  - Response Body: {"id": "67890", "name": "John Doe"}

Session:
  - Session ID:    abcdef123456
  - Geo-location:  New York, USA

Performance:
  - Memory Used:   75MB
  - CPU Usage:     15%

Errors:
  - None

---------------------------------------------------------------------------

''');
  });

  test('api model ...', () {
    print('''
╭─────────────────────────────────────────────────────────────────────────╮
│ [2025-01-16 14:23:45] [INFO] [API Consumption]                          │
├─────────────────────────────────────────────────────────────────────────┤
│ Request:                                                                │
│   - Method:        POST                                                 │
│   - URL:           /api/v1/users                                        │
│   - IP:            192.168.1.10                                         │
│   - User-Agent:    Mozilla/5.0 (Windows NT 10.0; Win64; x64)            │
│   - Auth User ID:  12345                                                │
│   - Headers:                                                            │
│     {                                                                   │
│       "Authorization": "Bearer xyz",                                    │
│       "Content-Type": "application/json"                                │
│     }                                                                   │
│   - Parameters:                                                         │
│     {                                                                   │
│       "name": "John Doe",                                               │
│       "email": "john@example.com"                                       │
│     }                                                                   │
│                                                                         │
│ Response:                                                               │
│   - Status Code:   201 Created                                          │
│   - Time Taken:    150 ms                                               │
│   - Headers:                                                            │
│     {                                                                   │
│       "Content-Type": "application/json"                                │
│     }                                                                   │
│   - Response Body:                                                      │
│     {                                                                   │
│       "id": "67890",                                                    │
│       "name": "John Doe"                                                │
│     }                                                                   │
│                                                                         │
│ Session:                                                                │
│   - Session ID:    abcdef123456                                         │
│   - Geo-location:  New York, USA                                        │
│                                                                         │
│ Performance:                                                            │
│   - Memory Used:   75 MB                                                │
│   - CPU Usage:     15%                                                  │
│                                                                         │
│ Errors:                                                                 │
│   - None                                                                │
│                                                                         │
╰─────────────────────────────────────────────────────────────────────────╯

''');
  });
  test('colorized', () {
    String result = '''
╭─────────────────────────────────────────────────────────────────────────╮
│ [2025-01-16 14:23:45] [INFO] [API Consumption]                          │
├─────────────────────────────────────────────────────────────────────────┤
│ Request:                                                                │
├╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴┤
│ ├─ Method:        POST                                                  │
│ ├─ URL:           /api/v1/users                                         │
│ ├─ IP:            192.168.1.10                                          │
│ ├─ User-Agent:    Mozilla/5.0 (Windows NT 10.0; Win64; x64)             │
│ ├─ Auth User ID:  12345                                                 │
│ ├─ Headers:                                                             │
│ │   ├─ Authorization: "Bearer xyz"                                      │
│ │   └─ Content-Type: "application/json"                                 │
│ └─ Parameters:                                                          │
│     ├─ name: "John Doe"                                                 │
│     └─ email: "john@example.com"                                        │
├╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴┤
│ Response:                                                               │
├╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴┤
│ ├─ Status Code:   201 Created                                           │
│ ├─ Time Taken:    150 ms                                                │
│ ├─ Headers:                                                             │
│ │   └─ Content-Type: "application/json"                                 │
│ └─ Response Body:                                                       │
│     ├─ id: "67890"                                                      │
│     └─ name: "John Doe"                                                 │
│                                                                         │
│ Session:                                                                │
│ ├─ Session ID:    abcdef123456                                          │
│ └─ Geo-location:  New York, USA                                         │
│                                                                         │
│ Performance:                                                            │
│ ├─ Memory Used:   75 MB                                                 │
│ └─ CPU Usage:     15%                                                   │
│                                                                         │
│ Errors:                                                                 │
│ └─ None                                                                 │
│                                                                         │
╰─────────────────────────────────────────────────────────────────────────╯
''';
    // print(result);

    String colorize = result;

    colorize = InjectStr.customWord(
      colorize,
      '╭─',
      0,
      '\x1B[31m',
      line: 1,
      // allLines: true,
    );

    print(colorize);
  });

  test('api model ...', () {
    // Definindo as cores
    const String reset = '\x1B[0m';
    const String red = '\x1B[31m';
    const String green = '\x1B[32m';
    const String yellow = '\x1B[33m';
    const String blue = '\x1B[34m';
    const String magenta = '\x1B[35m';
    const String cyan = '\x1B[36m';
    const String bold = '\x1B[1m';

    print(
      '$cyan╭─────────────────────────────────────────────────────────────────────────╮$reset',
    );
    print(
      '$cyan│ $blue[2025-01-16 14:23:45] [INFO] [API Consumption] $cyan                         │$reset',
    );
    print(
        '$cyan├─────────────────────────────────────────────────────────────────────────┤$reset');

    print(
        '$cyan│ $yellow$bold Request:$reset                                                   $cyan     |$reset');
    print(
        '$yellow├╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴┤$reset');
    print(
        '$cyan│ ├─ Method:        $magenta POST$cyan                                                  │$reset');
    print(
        '$cyan│ ├─ URL:           $magenta/api/v1/users$cyan                                         │$reset');
    print(
        '$cyan│ ├─ IP:            $magenta 192.168.1.10$cyan                                          │$reset');
    print(
        '$cyan│ ├─ User-Agent:    $magenta Mozilla/5.0 (Windows NT 10.0; Win64; x64)$cyan             │$reset');
    print(
        '$cyan│ ├─ Auth User ID:  $magenta 12345$cyan                                                 │$reset');
    print(
        '$cyan│ ├─ Headers:$reset                                                             │$reset');
    print(
        '$cyan│ │   ├─ Authorization: "$magenta Bearer xyz$cyan"$reset                               │$reset');
    print(
        '$cyan│ │   └─ Content-Type: "$magenta application/json$cyan"$reset                         │$reset');
    print(
        '$cyan│ └─ Parameters:$reset                                                          │$reset');
    print(
        '$cyan│     ├─ name: "$magenta John Doe$cyan"$reset                                        │$reset');
    print(
        '$cyan│     └─ email: "$magenta john@example.com$cyan"$reset                               │$reset');

    print(
        '$cyan├╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴┤$reset');

    print('$yellow│ $bold Response:$reset');
    print(
        '$yellow├╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴┤$reset');
    print(
        '$cyan│ ├─ Status Code:   $green 201 Created$cyan                                           │$reset');
    print(
        '$cyan│ ├─ Time Taken:    $green 150 ms$cyan                                                │$reset');
    print(
        '$cyan│ ├─ Headers:$reset                                                             │$reset');
    print(
        '$cyan│ │   └─ Content-Type: "$magenta application/json$cyan"$reset                         │$reset');
    print(
        '$cyan│ └─ Response Body:$reset                                                       │$reset');
    print(
        '$cyan│     ├─ id: "$magenta 67890$cyan"$reset                                          │$reset');
    print(
        '$cyan│     └─ name: "$magenta John Doe$cyan"$reset                                     │$reset');

    print(
        '$cyan├╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴┤$reset');

    print('$yellow│ $bold Session:$reset');
    print(
        '$yellow├╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴┤$reset');
    print(
        '$cyan│ ├─ Session ID:    $magenta abcdef123456$cyan                                          │$reset');
    print(
        '$cyan│ └─ Geo-location:  $magenta New York, USA$cyan                                         │$reset');

    print(
        '$cyan├╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴┤$reset');

    print('$yellow│ $bold Performance:$reset');
    print(
        '$yellow├╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴┤$reset');
    print(
        '$cyan│ ├─ Memory Used:   $magenta 75 MB$cyan                                                │$reset');
    print(
        '$cyan│ └─ CPU Usage:     $magenta 15%$cyan                                                  │$reset');

    print(
        '$cyan├╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴╴┤$reset');

    print('$yellow│ $bold Errors:$reset');
    print('$yellow└─ None$reset');

    print(
        '$cyan╰─────────────────────────────────────────────────────────────────────────╯$reset');
  });
}
