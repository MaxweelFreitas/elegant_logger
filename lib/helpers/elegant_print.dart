import 'package:flutter/foundation.dart';

/// Writes a message to the console using `debugPrint`.
///
/// If [forcePrint] is `true`, the message will always be printed, even in
/// production mode. If [forcePrint] is `false`, the message will only be printed
/// in debug mode.
///
/// The message will not be printed if it is `null` or an empty string.
///
/// - [message]: The message to be printed. If `null` or empty, the function
///   returns without printing anything.
/// - [forcePrint]: A boolean that determines if the message should be printed
///   regardless of the build mode. Defaults to `false`.
void write(String? message, {bool forcePrint = false}) {
  if (message == null || message.isEmpty) {
    return;
  }

  if (forcePrint) {
    debugPrint(message);
  } else {
    assert(() {
      debugPrint(message);
      return true;
    }());
  }
}
