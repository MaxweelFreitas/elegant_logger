import 'dart:developer';

import 'elegant_box.dart';
import 'x_term/x_term_color.dart';
import 'x_term/x_term_style.dart';

class DrawFunctions {
  static void drawTop({
    String emoji = '',
    String borderColor = XTermColor.white,
    String boxTopLeftBorder = ElegantBox.topLeft,
    String boxTopRightBorder = ElegantBox.topRight,
    String logTypeColor = '',
    String logType = '',
    String boxMiddleRight = ElegantBox.middleRight,
    String boxMiddleLeft = ElegantBox.middleLeft,
    int lineLength = 75,
  }) {
    if (logType.isEmpty) {
      log(
        '$borderColor$boxTopLeftBorder${horizontalDivider(lineLength: lineLength)}$boxTopRightBorder${XTermStyle.reset}',
      );
    } else if (emoji.isNotEmpty && logType.isNotEmpty) {
    } else if (emoji.isNotEmpty) {
      final tag = '$boxMiddleRight$logTypeColor$emoji$logType$borderColor$boxMiddleLeft';
      //calcular espaço caso venha apenas o icone
      final lenWithIcon = lineLength - emoji.length;
      //calcular o espaçõ caso venha um logType
    } else if (logType.isNotEmpty) {}
    //TypedTop ⇒ ╭┤⎕ ⏾⏾⏾⏾⏾ ├───────────────────────────────────────────────────────────────╮
    //UnTyped  ⇒ ╭──────────────────────────────────────────────────────────────────────────╮
  }

  static String horizontalDivider({int lineLength = 75, bool isDashed = false}) {
    late final String lineType;
    if (!isDashed) {
      lineType = ElegantBox.line;
    } else {
      lineType = ElegantBox.dashedRight;
    }
    return List.filled(lineLength - 2, lineType).join();
  }

  static void drawMedium({
    String borderColor = XTermColor.white,
    String boxMiddleRight = ElegantBox.middleRight,
    String boxMiddleLeft = ElegantBox.middleLeft,
    int lineLength = 75,
    bool isDashed = false,
  }) {
    //
    //Dashed ⇒ ├╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶┤
    //Lined  ⇒ ├──────────────────────────────────────────────────────────────────────────┤

    log(
      '$borderColor$boxMiddleLeft${horizontalDivider(lineLength: lineLength, isDashed: isDashed)}$boxMiddleRight${XTermStyle.reset}',
    );
  }

  static void drawBottom({
    String borderColor = XTermColor.white,
    String boxBottomLeftBorder = ElegantBox.bottomLeft,
    String boxBottomRightBorder = ElegantBox.bottomRight,
    int lineLength = 75,
  }) {
    //Example
    //Lined  ⇒ ╰──────────────────────────────────────────────────────────────────────────╯

    log(
      '$borderColor$boxBottomLeftBorder${horizontalDivider(lineLength: lineLength)}$boxBottomRightBorder${XTermStyle.reset}',
    );
  }

  
}
