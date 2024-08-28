import 'package:flutter/foundation.dart';
import 'package:poc_ml/helpers/x_term/x_term_color.dart';

import 'helpers/elegant_print.dart';
import 'helpers/x_term/x_term_style.dart';

class NZLog {
  static const redBg = '\x1B[31m';

  static const bold = '\x1B[1m';
  static const resetBold = '\x1B[22m';

  static const errorIcon = '🚨';
  static const warningIcon = '🚧';
  static const infoIcon = '📢';
  static const debugIcon = '🐜';

  static const lineLength = 75;

  static const topLeftCorner = '┌';
  static const rTopLeftCorner = '╭';
  static const topRightCorner = '┐';
  static const rTopRightCorner = '╮';
  static const bottomLeftCorner = '└';
  static const rBottomLeftCorner = '╰';
  static const bottomRightCorner = '┘';
  static const rBottomRightCorner = '╯';
  static const middleleftCorner = '├';
  static const middleRightCorner = '┤';
  static const middleTopCorner = '┰';
  static const middleBottomCorner = '┸';
  static const verticalLine = '│';
  static const line = '─';
  static const dashed = '╶';

  static void error({
    String emoji = errorIcon,
    String title = '',
    String msg = '',
    String source = '',
    String color = '\x1B[31m',
    int lineLength = lineLength,
    String url = '',
    String linkText = '',
    bool isDashed = false,
    bool forcePrint = false,
  }) {
    _box(
      logType:
          '${NZLog.middleRightCorner}$emoji Error ${NZLog.middleleftCorner}',
      title: title,
      msg: msg,
      source: source,
      color: color,
      lineLength: lineLength,
      url: url,
      linkText: linkText,
      isDashed: isDashed,
      forcePrint: forcePrint,
    );
  }

  static void warning({
    String emoji = warningIcon,
    String title = '',
    String msg = '',
    String source = '',
    String color = '\x1B[33m',
    int lineLength = lineLength,
    String url = '',
    String linkText = '',
    bool isDashed = false,
    bool forcePrint = false,
  }) {
    _box(
      logType:
          '${NZLog.middleRightCorner}$emoji Warning ${NZLog.middleleftCorner}',
      title: title,
      msg: msg,
      source: source,
      color: color,
      lineLength: lineLength,
      url: url,
      linkText: linkText,
      isDashed: isDashed,
      forcePrint: forcePrint,
    );
  }

  static void info({
    String emoji = infoIcon,
    String title = '',
    String msg = '',
    String source = '',
    String color = '\x1B[36m',
    int lineLength = lineLength,
    String url = '',
    String linkText = '',
    bool isDashed = false,
    bool forcePrint = false,
  }) {
    _box(
      logType:
          '${NZLog.middleRightCorner}$emoji Info ${NZLog.middleleftCorner}',
      title: title,
      msg: msg,
      source: source,
      color: color,
      lineLength: lineLength,
      url: url,
      linkText: linkText,
      isDashed: isDashed,
      forcePrint: forcePrint,
    );
  }

  static void debug({
    String emoji = debugIcon,
    String title = '',
    String msg = '',
    String source = '',
    String color = '\x1B[35m',
    int lineLength = lineLength,
    String url = '',
    String linkText = '',
    bool isDashed = false,
    bool forcePrint = false,
  }) {
    _box(
      logType:
          '${NZLog.middleRightCorner}$emoji Debug ${NZLog.middleleftCorner}',
      title: title,
      msg: msg,
      source: source,
      color: color,
      lineLength: lineLength,
      url: url,
      linkText: linkText,
      isDashed: isDashed,
      forcePrint: forcePrint,
    );
  }
}

String _horizontalDivider({int lineLength = 75, bool isDashed = false}) {
  late final String lineType;
  if (!isDashed) {
    lineType = NZLog.line;
  } else {
    lineType = NZLog.dashed;
  }
  return List.filled(lineLength - 1, lineType).join();
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
  String logType = '',
  String title = '',
  String msg = '',
  String source = '',
  String color = '\x1B[37m',
  int lineLength = 75,
  String url = '',
  String linkText = '',
  bool isDashed = false,
  bool forcePrint = false,
}) {
  if (kDebugMode || forcePrint) {
    _drawTop(logType: logType, color: color, lineLength: lineLength);

    if (title.isNotEmpty) {
      _drawTitle(
        msg: title,
        color: color,
        lineLength: lineLength,
      );
      _drawMedium(color: color, lineLength: lineLength, isDashed: isDashed);
    }
    _drawText(
      prefix: '${NZLog.bold}Log Time: ${NZLog.resetBold}$color',
      msg: '${_showDateTime(DateTime.now())}$color',
      color: color,
      lineLength: lineLength + 19,
    );
    _drawMedium(color: color, lineLength: lineLength, isDashed: isDashed);

    if (source.isNotEmpty) {
      _drawText(
        prefix: '${NZLog.bold}Source path: ${NZLog.resetBold}',
        msg: XTermStyle.link(
          linkText: source,
          url: '$color$source$color',
        ),
        color: color,
        lineLength: lineLength,
      );
      _drawMedium(color: color, lineLength: lineLength, isDashed: isDashed);
    }

    if (msg.isNotEmpty) {
      _drawText(
        prefix: '${NZLog.bold}Message: ${NZLog.resetBold}',
        msg: msg,
        color: color,
        lineLength: lineLength,
      );
    }

    if (url.isNotEmpty) {
      final linkMessage = XTermStyle.link(url: url, linkText: linkText);
      _drawText(
        msg: linkMessage,
        color: color,
        lineLength: linkMessage.length - 10 + lineLength,
      );
    }

    _drawBottom(color: color, lineLength: lineLength);
  }
}

void _drawTop({
  String logType = '',
  String color = '\x1B[37m',
  int lineLength = 75,
}) {
  if (logType.isNotEmpty) {
    lineLength = lineLength - logType.length;
  } else {
    lineLength = lineLength + logType.length;
  }
  write(
    '$color${NZLog.rTopLeftCorner}$logType${_horizontalDivider(lineLength: lineLength)}${NZLog.rTopRightCorner}\x1B[0m',
  );
}

void _drawTitle({
  String msg = '',
  String color = '\x1B[37m',
  int lineLength = 75,
}) {
  const bold = '\x1B[1m';
  const resetBold = '\x1B[22m';
  final numCharacters = lineLength - 3;

  for (int i = 0; i < msg.length; i += numCharacters) {
    int end = (i + numCharacters < msg.length) ? i + numCharacters : msg.length;
    String part = msg.substring(i, end);

    if (part.length < numCharacters) {
      part = part.padRight(numCharacters);
    }
    String line = '| $bold$part$resetBold |';
    write('$color$line\x1B[0m');
  }
}

void _drawText({
  String prefix = '',
  String msg = '',
  String color = '\x1B[37m',
  int lineLength = 75,
}) {
  var textLine = StringBuffer();

  List<String> parts = [];
  final numCharacters = lineLength - 3;

  for (int i = 0; i < msg.length; i += numCharacters) {
    int end = (i + numCharacters < msg.length) ? i + numCharacters : msg.length;
    String part = msg.substring(i, end);

    if (part.length < numCharacters) {
      part = part.padRight(numCharacters);
    }

    if (i == 0 && prefix.isNotEmpty) {
      part = '$prefix $part'.substring(0, numCharacters);
    }

    parts.add('| $part |');
  }

  textLine.writeAll(parts, '\n');

  write(
    '$color$textLine\x1B[0m',
  );
}

void _drawMedium({
  String color = '\x1B[37m',
  int lineLength = 75,
  bool isDashed = false,
}) {
  write(
    '$color${NZLog.middleleftCorner}${_horizontalDivider(lineLength: lineLength, isDashed: isDashed)}${NZLog.middleRightCorner}\x1B[0m',
  );
}

void _drawBottom({
  String color = '\x1B[37m',
  int lineLength = 75,
}) {
  write(
    '$color${NZLog.rBottomLeftCorner}${_horizontalDivider(lineLength: lineLength)}${NZLog.rBottomRightCorner}\x1B[0m',
  );
}

String formatMessageWithColorsLn({
  String label = '',
  String message = '',
  String divider = '',
  String dividerColor = '',
  String labelColor = '',
  String messageColor = '',
  int maxCharsPerLine = 60,
}) {
  // Calcula o espaço fixo para as linhas (excluindo cores)
  int fixedChars = divider.length * 2 + 3; // 3 espaços em branco

  // Prepara o resultado final
  StringBuffer result = StringBuffer();

  // Adiciona a primeira linha com a label
  String firstLine = '$dividerColor$divider $labelColor$label $messageColor';
  int firstLineLength = firstLine.length -
      dividerColor.length -
      labelColor.length -
      messageColor.length;

  if (firstLineLength > maxCharsPerLine) {
    // Divide a label em palavras para tratar a quebra de linha
    List<String> labelWords = label.split(' ');
    String currentLabelLine = '$dividerColor$divider $labelColor';
    int currentLabelLineLength =
        divider.length + 1; // considerando o divider e o espaço após ele

    for (int i = 0; i < labelWords.length; i++) {
      String word = labelWords[i];

      if (currentLabelLineLength + word.length + 1 >
          maxCharsPerLine - fixedChars) {
        // Preenche a linha atual com espaços em branco até o limite
        int remainingSpace =
            maxCharsPerLine - currentLabelLineLength - fixedChars;
        currentLabelLine =
            currentLabelLine.padRight(currentLabelLine.length + remainingSpace);

        // Adiciona a linha atual ao resultado
        result.writeln('$currentLabelLine$dividerColor$divider');

        // Inicia uma nova linha
        currentLabelLine = '$dividerColor$divider $labelColor$word ';
        currentLabelLineLength = divider.length + 1 + word.length + 1;
      } else {
        currentLabelLine += '$word ';
        currentLabelLineLength += word.length + 1;
      }
    }

    // Preenche a última linha da label com espaços em branco até o limite
    int remainingSpace = maxCharsPerLine - currentLabelLineLength - fixedChars;
    currentLabelLine =
        currentLabelLine.padRight(currentLabelLine.length + remainingSpace);
    result.writeln('$currentLabelLine$dividerColor$divider');
  } else {
    // Preenche a linha da label com espaços em branco até o limite
    int remainingSpace = maxCharsPerLine - firstLineLength - fixedChars;
    firstLine = firstLine.padRight(firstLine.length + remainingSpace);
    result.writeln('$firstLine$dividerColor$divider');
  }

  // Processa a mensagem
  String currentLine = '$dividerColor$divider $messageColor';
  int currentLineLength = divider.length + 1;

  List<String> words = message.split(' ');

  for (int i = 0; i < words.length; i++) {
    String word = words[i];

    if ((currentLineLength + word.length + 1) > maxCharsPerLine - fixedChars) {
      // Preenche a linha atual com espaços em branco até o limite
      int remainingSpace = maxCharsPerLine - currentLineLength - fixedChars;
      currentLine = currentLine.padRight(currentLine.length + remainingSpace);

      // Adiciona a linha atual ao resultado
      result.writeln('$currentLine$dividerColor$divider');

      // Inicia uma nova linha
      currentLine = '$dividerColor$divider $messageColor$word ';
      currentLineLength = divider.length + 1 + word.length + 1;
    } else {
      currentLine += '$word ';
      currentLineLength += word.length + 1;
    }
  }

  // Preenche a última linha da mensagem com espaços em branco até o limite
  int remainingSpace = maxCharsPerLine - currentLineLength - fixedChars;
  currentLine = currentLine.padRight(currentLine.length + remainingSpace);
  result.writeln('$currentLine$dividerColor$divider');

  return result.toString();
}

String formatMessageWithColors({
  String label = '',
  String message = '',
  String divider = '',
  String dividerColor = '',
  String labelColor = '',
  String messageColor = '',
  int maxCharsPerLine = 60,
}) {
  // Calcula o espaço fixo (excluindo cores)
  int fixedChars = divider.length * 2 + 3; // 3 espaços em branco

  // Prepara o resultado final
  StringBuffer result = StringBuffer();

  // Divide a label e a mensagem em palavras
  List<String> labelWords = label.split(' ');
  List<String> messageWords = message.split(' ');

  // Combina label e mensagem em um bloco único para facilitar o processamento
  List<String> combinedWords = labelWords + messageWords;

  // Inicia a construção da linha atual
  String currentLine = '$dividerColor$divider $labelColor';
  int currentLineLength = divider.length + 1; // incluindo espaço após o divider

  bool labelProcessed = false;

  for (String word in combinedWords) {
    // Se a linha atual estiver vazia, inicia com o divider e a cor apropriada
    if (currentLineLength == divider.length + 1) {
      if (labelProcessed) {
        currentLine += messageColor;
      }
    }

    // Verifica se a adição da próxima palavra ultrapassa o limite de caracteres na linha atual
    if (currentLineLength + word.length + 1 > maxCharsPerLine - fixedChars) {
      // Preenche a linha atual com espaços em branco até o limite
      int remainingSpace = maxCharsPerLine - currentLineLength - fixedChars;
      currentLine = currentLine.padRight(currentLine.length + remainingSpace);

      // Adiciona a linha atual ao resultado
      result.writeln('$currentLine$dividerColor$divider');

      // Inicia uma nova linha com o divider e a cor apropriada
      currentLine = '$dividerColor$divider ';
      currentLineLength = divider.length + 1;

      if (labelProcessed) {
        currentLine += '$messageColor$word ';
        currentLineLength += messageColor.length + word.length + 1;
      } else {
        currentLine += '$labelColor$word ';
        currentLineLength += labelColor.length + word.length + 1;
        labelProcessed = !combinedWords
            .sublist(labelWords.length)
            .contains(word); // Processou a label se já passou pelos termos dela
      }
    } else {
      // Adiciona a palavra à linha atual
      currentLine += '$word ';
      currentLineLength += word.length + 1;
    }

    // Após processar a label, muda para a cor da mensagem
    if (!labelProcessed && currentLineLength >= maxCharsPerLine - fixedChars) {
      labelProcessed = true;
    }
  }

  // Preenche a última linha com espaços em branco até o limite
  int remainingSpace = maxCharsPerLine - currentLineLength - fixedChars;
  currentLine = currentLine.padRight(currentLine.length + remainingSpace);
  result.writeln('$currentLine$dividerColor$divider');

  return result.toString();
}

String line({
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
}) {
  List<String> content = [];
  int numOfChar = 0;

  // Considerando dois dividers
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
        lenNewWord += 1; // Espaço para separar palavras
      }

      if (lenNewWord < maxCharsPerLine) {
        content.add(word);
      } else {
        break;
      }
    }

    // Adiciona o padding à direita para completar a linha
    final charsWithSpaces = content.join(' ').length;
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

    write(coloredLine);

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
    result.write('$dividerColor$divider ');

    for (var word in content) {
      if (labelWords.contains(word)) {
        result.write('$labelColor$word ');
      } else if (messageWords.contains(word)) {
        result.write('$messageColor$word ');
      } else {
        result.write('$word ');
      }
    }

    result.write('$dividerColor$divider$reset');
  }
  return result.toString();
}
