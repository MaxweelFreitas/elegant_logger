import 'dart:io';

import 'package:flutter/material.dart';

abstract class SaveLogService {
  Future<String> saveLog(String log, {String filePath = ''});
}

class TxtSaveLogService implements SaveLogService {
  @override
  Future<String> saveLog(String log, {String filePath = ''}) async {
    try {
      String path = filePath;

      if (filePath.isEmpty) {
        // Obtém o diretório de documentos
        final directoryRootPath = Directory.current.path;

        final directoryLog = Directory('$directoryRootPath/logs');

        if (!directoryLog.existsSync()) {
          directoryLog.createSync();
        }

        final timeStamp = DateTime.now().toIso8601String();

        path = '${directoryLog.path}/logs_$timeStamp.txt';
      }
      // Cria uma referência ao arquivo de log
      final file = File(path);

      // Adiciona o log ao arquivo
      await file.writeAsString('$log\n', mode: FileMode.append);

      return path;
    } catch (e) {
      debugPrint('Erro ao salvar log: $e');
      return '';
    }
  }
}
