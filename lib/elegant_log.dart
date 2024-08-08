import 'package:flutter/foundation.dart';
import 'package:poc_ml/dtos/border_box.dart';
import 'package:poc_ml/helpers/elegant_icons.dart';
import 'package:poc_ml/helpers/x_term/x_term_color.dart';
import 'package:poc_ml/helpers/x_term/x_term_style.dart';

import 'dtos/log_entry_color.dart';
import 'dtos/log_entry_content.dart';
import 'dtos/tag_type.dart';
import 'helpers/converter.dart';
import 'helpers/draw_functions.dart';
import 'services/save_log_service.dart';

class ElegantLog {
  static const lineLength = 75;

// '${ElegantBox.middleRight}$emoji Error ${ElegantBox.middleLeft}'
  static void error({
    BorderBox borders = const BorderBox(),
    LogEntryContent logEntryContent = const LogEntryContent(),
    LogEntryColor logEntryColor = const LogEntryColor(),
    int lineLength = 75,
    bool isDated = true,
    bool isDashed = false,
    bool forcePrint = false,
    TagType tag = const TagType(
      icon: ElegantIcons.errorIcon,
      name: ' Error ',
      nameColor: XTermColor.red,
    ),
  }) {
    _box(
      emoji: tag.icon,
      logTypeColor: tag.nameColor,
      logType: tag.name,
      borders: borders,
      dividerColor: logEntryColor.dividerColor,
      divider: logEntryContent.divider,
      labelTitleColor: logEntryColor.labelTitleColor,
      labelTitle: logEntryContent.labelTitle,
      titleColor: logEntryColor.titleColor,
      title: logEntryContent.title,
      labelTimeColor: logEntryColor.labelTimeColor,
      labelTime: logEntryContent.labelTime,
      timeColor: logEntryColor.timeColor,
      time: logEntryContent.time,
      labelMessageColor: logEntryColor.labelMessageColor,
      labelMessage: logEntryContent.labelMessage,
      messageColor: logEntryColor.messageColor,
      message: logEntryContent.message,
      sourceColor: logEntryColor.sourceColor,
      source: logEntryContent.source,
      lineLength: lineLength,
      url: logEntryContent.url,
      linkText: logEntryContent.linkText,
      isDated: isDated,
      isDashed: isDashed,
      forcePrint: forcePrint,
    );
  }

  static void warning({
    TagType tag = const TagType(
      icon: ElegantIcons.warningIcon,
      name: ' Warning ',
      nameColor: XTermColor.yellow,
    ),
    BorderBox borders = const BorderBox(),
    int lineLength = 75,
    LogEntryContent logEntryContent = const LogEntryContent(
      divider: '|',
      title: '',
      labelTime: '',
      time: '',
      message: '',
      source: '',
      url: '',
      linkText: '',
    ),
    LogEntryColor logEntryColor = const LogEntryColor(
      timeColor: '',
      sourceColor: XTermColor.white,
      dividerColor: XTermColor.yellow,
      titleColor: XTermColor.yellow,
      labelTimeColor: XTermColor.yellow,
      messageColor: XTermColor.white,
    ),
    bool isDated = true,
    bool isDashed = false,
    bool forcePrint = false,
  }) {
    _box(
      emoji: tag.icon,
      logTypeColor: tag.nameColor,
      logType: tag.name,
      borders: borders,
      dividerColor: logEntryColor.dividerColor,
      divider: logEntryContent.divider,
      titleColor: logEntryColor.titleColor,
      title: logEntryContent.title,
      labelTimeColor: logEntryColor.labelTimeColor,
      labelTime: logEntryContent.labelTime,
      timeColor: logEntryColor.timeColor,
      time: logEntryContent.time,
      messageColor: logEntryColor.messageColor,
      message: logEntryContent.message,
      sourceColor: logEntryColor.sourceColor,
      source: logEntryContent.source,
      lineLength: lineLength,
      url: logEntryContent.url,
      linkText: logEntryContent.linkText,
      isDated: isDated,
      isDashed: isDashed,
      forcePrint: forcePrint,
    );
  }

  static void info({
    BorderBox borders = const BorderBox(),
    LogEntryColor logEntryColor = const LogEntryColor(
      timeColor: '',
      dividerColor: XTermColor.blue,
      titleColor: XTermColor.blue,
      labelTimeColor: XTermColor.blue,
      messageColor: XTermColor.white,
      sourceColor: XTermColor.white,
    ),
    LogEntryContent logEntryContent = const LogEntryContent(
      divider: '|',
      title: '',
      labelTime: '',
      time: '',
      message: '',
      source: '',
      linkText: '',
      url: '',
    ),
    TagType tag = const TagType(
      icon: ElegantIcons.infoIcon,
      name: ' Info ',
      nameColor: XTermColor.blue,
    ),
    int lineLength = 75,
    bool isDated = true,
    bool isDashed = false,
    bool forcePrint = false,
  }) {
    _box(
      emoji: tag.icon,
      logTypeColor: tag.nameColor,
      logType: tag.name,
      borders: borders,
      dividerColor: logEntryColor.dividerColor,
      divider: logEntryContent.divider,
      titleColor: logEntryColor.titleColor,
      title: logEntryContent.title,
      labelTimeColor: logEntryColor.labelTimeColor,
      labelTime: logEntryContent.labelTime,
      timeColor: logEntryColor.timeColor,
      time: logEntryContent.time,
      messageColor: logEntryColor.messageColor,
      message: logEntryContent.message,
      sourceColor: logEntryColor.sourceColor,
      source: logEntryContent.source,
      lineLength: lineLength,
      url: logEntryContent.url,
      linkText: logEntryContent.linkText,
      isDated: isDated,
      isDashed: isDashed,
      forcePrint: forcePrint,
    );
  }

  static void debug({
    BorderBox borders = const BorderBox(),
    LogEntryContent logEntryContent = const LogEntryContent(
      divider: '|',
      title: '',
      labelTime: '',
      time: '',
      message: '',
      source: '',
      url: '',
      linkText: '',
    ),
    LogEntryColor logEntryColor = const LogEntryColor(
      timeColor: '',
      dividerColor: XTermColor.magenta,
      titleColor: XTermColor.magenta,
      labelTimeColor: XTermColor.magenta,
      messageColor: XTermColor.white,
      sourceColor: XTermColor.white,
    ),
    TagType tag = const TagType(
      icon: ElegantIcons.debugIcon,
      name: ' Debug ',
      nameColor: XTermColor.magenta,
    ),
    int lineLength = 75,
    bool isDated = true,
    bool isDashed = false,
    bool forcePrint = false,
  }) {
    _box(
      emoji: tag.icon,
      logTypeColor: tag.nameColor,
      logType: tag.name,
      borders: borders,
      dividerColor: logEntryColor.dividerColor,
      divider: logEntryContent.divider,
      titleColor: logEntryColor.titleColor,
      title: logEntryContent.title,
      labelTimeColor: logEntryColor.labelTimeColor,
      labelTime: logEntryContent.labelTime,
      timeColor: logEntryColor.timeColor,
      time: logEntryContent.time,
      messageColor: logEntryColor.messageColor,
      message: logEntryContent.message,
      sourceColor: logEntryColor.sourceColor,
      source: logEntryContent.source,
      lineLength: lineLength,
      url: logEntryContent.url,
      linkText: logEntryContent.linkText,
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
    DrawFunctions.drawTop(
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
      DrawFunctions.drawMedium(
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
      DrawFunctions.drawMedium(
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
      DrawFunctions.drawMedium(
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

    DrawFunctions.drawBottom(
      borderColor: dividerColor,
      boxBottomLeftBorder: borders.boxBottomLeftBorder,
      boxBottomRightBorder: borders.boxBottomRightBorder,
      lineLength: lineLength,
    );
  }
}

Future<String> drawText({
  String label = '',
  String message = '',
  String divider = '',
  String dividerColor = '',
  String labelColor = '',
  String messageColor = '',
  int maxCharsPerLine = 60,
  bool printLogToFile = true,
}) async {
  List<List<String>> corpus = [];
  List<String> labelWords = label.split(' ');
  List<String> messageWords = message.split(' ');
  String _logPath = '';

  int lastUsedWord = 0;

  final setOfWords = labelWords + messageWords;

  final SaveLogService saveService = TxtSaveLogService();

  do {
    final (b, logLine) = fillText(
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
      if (printLogToFile) {
        _logPath = await saveService.saveLog(logLine, filePath: _logPath);
      }
    } else {
      break;
    }
  } while (setOfWords.length > lastUsedWord);

  if (printLogToFile) {
    debugPrint('View logFile in $_logPath');
  }

  // print(corpus);

  return '';
}

(List<String>, String) fillText({
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
  final divSpace = divider.length * 2;

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
      } else if (currentWord > maxCharsPerLine) {
        List<String> chunks = splitString(word, maxCharsPerLine - 5);
        content.addAll(chunks);
        break;
      } else {
        break;
      }
    }

    // Adiciona o padding à direita para completar a linha
    // Adicionando o +1 pro calculo bater com o maxCharsPerLine, pois a linha tava ficando com tamanho igual ao maxCharsPerLine + 1
    //TODO: Verificar se o removeEscapes presta
    final charsWithSpaces = removeEscapedANSI(content.join(' ')).length;
    int padRight = maxCharsPerLine - (charsWithSpaces + divSpace);

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
    // Gerar linha colorida
    final coloredLine = _lineGenerator(
      labelColor: labelColor,
      messageColor: messageColor,
      dividerColor: dividerColor,
      divider: divider,
      labelWords: labelWords,
      messageWords: messageWords,
      content: content,
    );

    print(coloredLine);

    return (content, line);
  } else {
    return (<String>[], '');
  }
}

List<String> splitString(String text, int chunkSize) {
  List<String> chunks = [];
  for (int i = 0; i < text.length; i += chunkSize) {
    int endIndex = (i + chunkSize < text.length) ? i + chunkSize : text.length;
    chunks.add(text.substring(i, endIndex));
  }
  return chunks;
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
  var string = result.toString();
  if (string.startsWith(r'[31m| [36mLink: ]8;;')) {
    string.replaceAll(' ', '').trim();
  }
  return string;
}
