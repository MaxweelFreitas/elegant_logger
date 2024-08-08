import 'dart:io';

import 'package:flutter/foundation.dart';

import 'x_term/x_term_color.dart';

class System {
  static String getFileName(StackTrace stackTrace) {
    final resultLinks = System.getStackTraceLinks(stackTrace);
    if (kDebugMode) {
      return '📂 ${XTermColor.green}File name: 📄 ${XTermColor.blue}${resultLinks[0].split('/').last.split(':').first}';
    }
    {
      return '';
    }
  }

  static List<String> getStackTraceLinks(StackTrace stackTrace) {
    final pattern = RegExp(r'\(([^)]+)\)');
    final matches = pattern.allMatches(stackTrace.toString());

    List<String> links = matches.map((match) => match.group(1)!).toList();
    final packagePattern = RegExp(r'package:([^/]+)/(.+):(\d+):(\d+)');
    List<String> resultLinks = [];
    for (String link in links) {
      final match = packagePattern.firstMatch(link);

      if (match != null) {
        final restOfUrl = match.group(2)!;
        final lineNumber = match.group(3)!;
        final columnNumber = match.group(4)!;

        // Verificar se o link contém 'teste.dart'
        String updatedLink;
        if (restOfUrl.contains('teste.dart')) {
          updatedLink =
              'test/$restOfUrl:$lineNumber:$columnNumber'; // Substituir lib/ por test/
        } else {
          updatedLink = 'lib/$restOfUrl:$lineNumber:$columnNumber';
        }

        resultLinks.add(updatedLink);
      } else {
        // Substituir 'file:///' e 'Directory.current.path' por 'lib/' ou 'test/'
        final currentPath = Directory.current.path.replaceAll('\\', '/');
        var updatedLink = link.replaceFirst('file:///', '');
        if (updatedLink.contains('test.dart')) {
          // Substituir o caminho completo por test/
          updatedLink =
              updatedLink.replaceFirst(currentPath, '').replaceFirst('/', '');
        } else {
          updatedLink = updatedLink.replaceFirst(currentPath, 'lib');
        }
        resultLinks.add(updatedLink);
      }
    }
    return resultLinks;
  }
}
