import 'package:flutter/foundation.dart';
import 'package:poc_ml/dtos/border_box.dart';
import 'package:poc_ml/helpers/elegant_box.dart';
import 'package:poc_ml/helpers/elegant_icons.dart';
import 'package:poc_ml/helpers/x_term/x_term_color.dart';
import 'package:poc_ml/helpers/x_term/x_term_style.dart';

import 'helpers/converter.dart';

class ElegantLog {
  static const lineLength = 75;

// '${ElegantBox.middleRight}$emoji Error ${ElegantBox.middleLeft}'
  static void error({
    String emoji = ElegantIcons.errorIcon,
    BorderBox borders = const BorderBox(),
    String dividerColor = XTermColor.red,
    String divider = '|',
    String logTypeColor = XTermColor.red,
    String logType = ' Error ',
    String labelTitleColor = XTermColor.red,
    String labelTitle = '',
    String titleColor = XTermColor.red,
    String title = '',
    String labelTimeColor = XTermColor.red,
    String labelTime = '',
    String timeColor = '',
    String time = '',
    String labelMessageColor = XTermColor.red,
    String labelMessage = '',
    String messageColor = XTermColor.white,
    String message = '',
    String sourceColor = XTermColor.white,
    String source = '',
    int lineLength = 75,
    String url = '',
    String linkText = '',
    bool isDated = true,
    bool isDashed = false,
    bool forcePrint = false,
  }) {
    _box(
      emoji: emoji,
      borders: borders,
      dividerColor: dividerColor,
      divider: divider,
      logTypeColor: logTypeColor,
      logType: logType,
      labelTitleColor: labelTitleColor,
      labelTitle: labelTitle,
      titleColor: titleColor,
      title: title,
      labelTimeColor: labelTimeColor,
      labelTime: labelTime,
      timeColor: timeColor,
      time: time,
      labelMessageColor: labelMessageColor,
      labelMessage: labelMessage,
      messageColor: messageColor,
      message: message,
      sourceColor: sourceColor,
      source: source,
      lineLength: lineLength,
      url: url,
      linkText: linkText,
      isDated: isDated,
      isDashed: isDashed,
      forcePrint: forcePrint,
    );
  }

  static void warning({
    String emoji = ElegantIcons.warningIcon,
    BorderBox borders = const BorderBox(),
    String dividerColor = XTermColor.yellow,
    String divider = '|',
    String logTypeColor = XTermColor.yellow,
    String logType = ' Warning ',
    String titleColor = XTermColor.yellow,
    String title = '',
    String labelTimeColor = XTermColor.yellow,
    String labelTime = '',
    String timeColor = '',
    String time = '',
    String messageColor = XTermColor.white,
    String message = '',
    String sourceColor = XTermColor.white,
    String source = '',
    int lineLength = 75,
    String url = '',
    String linkText = '',
    bool isDated = true,
    bool isDashed = false,
    bool forcePrint = false,
  }) {
    _box(
      emoji: emoji,
      borders: borders,
      dividerColor: dividerColor,
      divider: divider,
      logTypeColor: logTypeColor,
      logType: logType,
      titleColor: titleColor,
      title: title,
      labelTimeColor: labelTimeColor,
      labelTime: labelTime,
      timeColor: timeColor,
      time: time,
      messageColor: messageColor,
      message: message,
      sourceColor: sourceColor,
      source: source,
      lineLength: lineLength,
      url: url,
      linkText: linkText,
      isDated: isDated,
      isDashed: isDashed,
      forcePrint: forcePrint,
    );
  }

  static void info({
    String emoji = ElegantIcons.infoIcon,
    BorderBox borders = const BorderBox(),
    String dividerColor = XTermColor.blue,
    String divider = '|',
    String logTypeColor = XTermColor.blue,
    String logType = ' Error ',
    String titleColor = XTermColor.blue,
    String title = '',
    String labelTimeColor = XTermColor.blue,
    String labelTime = '',
    String timeColor = '',
    String time = '',
    String messageColor = XTermColor.white,
    String message = '',
    String sourceColor = XTermColor.white,
    String source = '',
    int lineLength = 75,
    String url = '',
    String linkText = '',
    bool isDated = true,
    bool isDashed = false,
    bool forcePrint = false,
  }) {
    _box(
      emoji: emoji,
      borders: borders,
      dividerColor: dividerColor,
      divider: divider,
      logTypeColor: logTypeColor,
      logType: logType,
      titleColor: titleColor,
      title: title,
      labelTimeColor: labelTimeColor,
      labelTime: labelTime,
      timeColor: timeColor,
      time: time,
      messageColor: messageColor,
      message: message,
      sourceColor: sourceColor,
      source: source,
      lineLength: lineLength,
      url: url,
      linkText: linkText,
      isDated: isDated,
      isDashed: isDashed,
      forcePrint: forcePrint,
    );
  }

  static void debug({
    String emoji = ElegantIcons.debugIcon,
    BorderBox borders = const BorderBox(),
    String dividerColor = XTermColor.magenta,
    String divider = '|',
    String logTypeColor = XTermColor.magenta,
    String logType = ' Error ',
    String titleColor = XTermColor.magenta,
    String title = '',
    String labelTimeColor = XTermColor.magenta,
    String labelTime = '',
    String timeColor = '',
    String time = '',
    String messageColor = XTermColor.white,
    String message = '',
    String sourceColor = XTermColor.white,
    String source = '',
    int lineLength = 75,
    String url = '',
    String linkText = '',
    bool isDated = true,
    bool isDashed = false,
    bool forcePrint = false,
  }) {
    _box(
      emoji: emoji,
      borders: borders,
      dividerColor: dividerColor,
      divider: divider,
      logTypeColor: logTypeColor,
      logType: logType,
      titleColor: titleColor,
      title: title,
      labelTimeColor: labelTimeColor,
      labelTime: labelTime,
      timeColor: timeColor,
      time: time,
      messageColor: messageColor,
      message: message,
      sourceColor: sourceColor,
      source: source,
      lineLength: lineLength,
      url: url,
      linkText: linkText,
      isDated: isDated,
      isDashed: isDashed,
      forcePrint: forcePrint,
    );
  }
}

String _showDateTime(DateTime dateTime) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String year = dateTime.year.toString().padLeft(4, '0');
  String month = twoDigits(dateTime.month);
  String day = twoDigits(dateTime.day);
  String hour = twoDigits(dateTime.hour);
  String minute = twoDigits(dateTime.minute);
  String second = twoDigits(dateTime.second);

  return '$year-$month-$day $hour:$minute:$second';
}

String _horizontalDivider({int lineLength = 75, bool isDashed = false}) {
  late final String lineType;
  if (!isDashed) {
    lineType = ElegantBox.line;
  } else {
    lineType = ElegantBox.dashedRight;
  }
  return List.filled(lineLength - 2, lineType).join();
}

void _drawTop({
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
    debugPrint(
      '$borderColor$boxTopLeftBorder${_horizontalDivider(lineLength: lineLength)}$boxTopRightBorder${XTermStyle.reset}',
    );
  } else if (emoji.isNotEmpty && logType.isNotEmpty) {
  } else if (emoji.isNotEmpty) {
    final tag =
        '$boxMiddleRight$logTypeColor$emoji$logType$borderColor$boxMiddleLeft';
    //calcular espaço caso venha apenas o icone
    final lenWithIcon = lineLength - emoji.length;
    //calcular o espaçõ caso venha um logType
  } else if (logType.isNotEmpty) {}
  //TypedTop ⇒ ╭┤⎕ ⏾⏾⏾⏾⏾ ├───────────────────────────────────────────────────────────────╮
  //UnTyped  ⇒ ╭──────────────────────────────────────────────────────────────────────────╮
}

void _drawMedium({
  String borderColor = XTermColor.white,
  String boxMiddleRight = ElegantBox.middleRight,
  String boxMiddleLeft = ElegantBox.middleLeft,
  int lineLength = 75,
  bool isDashed = false,
}) {
  //
  //Dashed ⇒ ├╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶╶┤
  //Lined  ⇒ ├──────────────────────────────────────────────────────────────────────────┤
  debugPrint(
    '$borderColor$boxMiddleLeft${_horizontalDivider(lineLength: lineLength, isDashed: isDashed)}$boxMiddleRight${XTermStyle.reset}',
  );
}

void _drawBottom({
  String borderColor = XTermColor.white,
  String boxBottomLeftBorder = ElegantBox.bottomLeft,
  String boxBottomRightBorder = ElegantBox.bottomRight,
  int lineLength = 75,
}) {
  //Example
  //Lined  ⇒ ╰──────────────────────────────────────────────────────────────────────────╯
  debugPrint(
    '$borderColor$boxBottomLeftBorder${_horizontalDivider(lineLength: lineLength)}$boxBottomRightBorder${XTermStyle.reset}',
  );
}

void _box({
  String emoji = '',
  BorderBox borders = const BorderBox(),
  String dividerColor = '',
  String divider = '',
  String logTypeColor = '',
  String logType = '',
  String labelTitleColor = '',
  String labelTitle = '',
  String titleColor = '',
  String title = '',
  String labelTimeColor = '',
  String labelTime = '',
  String timeColor = '',
  String time = '',
  String labelMessageColor = '',
  String labelMessage = '',
  String messageColor = '',
  String message = '',
  String sourceColor = '',
  String source = '',
  int lineLength = 75,
  String url = '',
  String linkText = '',
  bool isDated = true,
  bool isDashed = false,
  bool forcePrint = false,
}) {
  if (kDebugMode || forcePrint) {
    _drawTop(
      emoji: emoji,
      borderColor: dividerColor,
      boxTopLeftBorder: borders.boxTopLeftBorder,
      boxTopRightBorder: borders.boxTopRightBorder,
      boxMiddleRight: borders.boxMiddleRight,
      boxMiddleLeft: borders.boxMiddleLeft,
      logTypeColor: logTypeColor,
      logType: logType,
      lineLength: lineLength,
    );

    if (title.isNotEmpty) {
      drawText(
        dividerColor: dividerColor,
        divider: divider,
        labelColor: labelTitleColor,
        label: labelTitle,
        messageColor: titleColor,
        message: title,
        maxCharsPerLine: lineLength,
      );
    }
    if (title.isNotEmpty && isDated) {
      _drawMedium(
        borderColor: dividerColor,
        boxMiddleRight: borders.boxMiddleRight,
        boxMiddleLeft: borders.boxMiddleLeft,
        lineLength: lineLength,
        isDashed: isDashed,
      );
    }

    if (isDated) {
      drawText(
        dividerColor: dividerColor,
        divider: divider,
        labelColor: labelTimeColor,
        label: labelTime.isEmpty ? 'Log Time:' : labelTime,
        messageColor: timeColor,
        message: time.isEmpty ? _showDateTime(DateTime.now()) : time,
        maxCharsPerLine: lineLength,
      );
    }

    if (isDated && source.isNotEmpty) {
      _drawMedium(
        borderColor: dividerColor,
        boxMiddleRight: borders.boxMiddleRight,
        boxMiddleLeft: borders.boxMiddleRight,
        lineLength: lineLength,
        isDashed: isDashed,
      );
    }

    if (source.isNotEmpty) {
      drawText(
        dividerColor: dividerColor,
        divider: divider,
        labelColor: dividerColor,
        label: 'Source path:',
        messageColor: sourceColor,
        message: XTermStyle.link(
          linkText: sourceColor + source,
          url: source,
        ),
        maxCharsPerLine: lineLength,
      );
    }

    if (source.isNotEmpty && message.isNotEmpty) {
      _drawMedium(
        borderColor: dividerColor,
        boxMiddleRight: borders.boxMiddleRight,
        boxMiddleLeft: borders.boxMiddleRight,
        lineLength: lineLength,
        isDashed: isDashed,
      );
    }

    if (message.isNotEmpty) {
      drawText(
        dividerColor: dividerColor,
        divider: divider,
        labelColor: dividerColor,
        label: labelMessage,
        messageColor: messageColor,
        message: message,
        maxCharsPerLine: lineLength,
      );
    }

    if (url.isNotEmpty) {
      final linkMessage = XTermStyle.link(url: url, linkText: linkText);

      drawText(
        dividerColor: dividerColor,
        divider: divider,
        labelColor: dividerColor,
        label: 'Link:',
        messageColor: messageColor,
        message: linkMessage,
        maxCharsPerLine: lineLength,
      );
    }

    _drawBottom(
      borderColor: dividerColor,
      boxBottomLeftBorder: borders.boxBottomLeftBorder,
      boxBottomRightBorder: borders.boxBottomRightBorder,
      lineLength: lineLength,
    );
  }
}

String drawText({
  String label = '',
  String message = '',
  String divider = '',
  String dividerColor = '',
  String labelColor = '',
  String messageColor = '',
  int maxCharsPerLine = 60,
}) {
  List<List<String>> corpus = [];
  List<String> labelWords = label.split(' ');
  List<String> messageWords = message.split(' ');

  int lastUsedWord = 0;

  final setOfWords = labelWords + messageWords;

  do {
    final b = fillText(
      lastIndex: lastUsedWord,
      dividerColor: XTermColor.red,
      labelColor: XTermColor.cyan,
      labelWords: labelWords,
      messageColor: XTermColor.white,
      messageWords: messageWords,
      maxCharsPerLine: maxCharsPerLine,
    );

    if (b.isNotEmpty) {
      corpus.add(b);
      if (b.last.isEmpty || b.last.contains(' ')) {
        b.removeAt(b.length - 1);
      }
      lastUsedWord += b.length;
    } else {
      break;
    }
  } while (setOfWords.length > lastUsedWord);

  // print(corpus);

  return '';
}

List<String> fillText({
  int lastIndex = 0,
  String labelColor = '',
  String messageColor = '',
  String dividerColor = '',
  List<String> labelWords = const [],
  List<String> messageWords = const [],
  String divider = '|',
  int maxCharsPerLine = 0,
  int indexStart = 0,
}) {
  List<String> content = [];
  int numOfChar = 0;

  // Considerando dois dividers e dois espaços
  final divSpace = divider.length * 2 + 2;

  final setOfWords = labelWords + messageWords;

  if (setOfWords.isNotEmpty) {
    for (var i = lastIndex; i < setOfWords.length; i++) {
      numOfChar = content.join(' ').length;
      int numCharWithSpaces = numOfChar + divSpace;

      final word = setOfWords[i];
      final currentWord = setOfWords[i].length;
      int lenNewWord = numCharWithSpaces + currentWord;

      // Adiciona espaço se não for a primeira palavra
      if (content.isNotEmpty) {
        lenNewWord += 1; // Espaco para separar palavras
      }

      if (lenNewWord < maxCharsPerLine) {
        content.add(word);
      } else {
        break;
      }
    }

    // Adiciona o padding à direita para completar a linha
    // Adicionando o +1 pro calculo bater com o maxCharsPerLine, pois a linha tava ficando com tamanho igual ao maxCharsPerLine + 1
    //TODO: Verificar se o removeEscapes presta
    final charsWithSpaces = removeEscapedANSI(content.join(' ')).length;
    int padRight = maxCharsPerLine - (charsWithSpaces + divSpace + 1);

    if (padRight > 0) {
      content.add(''.padRight(padRight));
    }

    // Formatar a linha com os dividers
    String line = '$divider ${content.join(' ')} $divider';

    // Ajustar o comprimento da linha para garantir que seja exato
    if (line.length < maxCharsPerLine) {
      line = line.padRight(maxCharsPerLine - 1) + divider;
    }

    // TODO: Line Colored Printer
    final p = _lineGenerator(
      labelColor: labelColor,
      messageColor: messageColor,
      dividerColor: dividerColor,
      divider: divider,
      labelWords: labelWords,
      messageWords: messageWords,
      content: content,
    );

    debugPrint(p);

    return content;
  } else {
    return [];
  }
}

String _lineGenerator({
  String labelColor = '',
  String messageColor = '',
  String dividerColor = '',
  String reset = '\x1B[0m',
  String divider = '|',
  List<String> labelWords = const [],
  List<String> messageWords = const [],
  List<String> content = const [],
}) {
  final result = StringBuffer();
  if (content.isNotEmpty) {
    result.write("$dividerColor$divider ");

    for (var word in content) {
      if (labelWords.contains(word)) {
        result.write("$labelColor$word ");
      } else if (messageWords.contains(word)) {
        result.write("$messageColor$word ");
      } else {
        result.write('$word ');
      }
    }

    result.write("$dividerColor$divider$reset");
  }
  return result.toString();
}
