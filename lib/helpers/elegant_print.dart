import 'package:flutter/foundation.dart';

/// Writes a message to the console using `debugPrint` in debug mode.
///
/// If the [message] is `null` or an empty string, the function returns without
/// performing any action.
///
/// In debug mode, it uses `debugPrint` to print the message. The `assert` function
/// is used to ensure that `debugPrint` is only called in debug mode. The `assert`
/// statement is not included in production builds, so `debugPrint` will not be
/// called in production.
///
/// - [message]: The message to be printed. If `null` or empty, the function
///   returns without printing anything.
void eLog(String? message) {
  if (message == null || message.isEmpty) {
    return;
  }

  assert(() {
    debugPrint(message);
    return true;
  }());
}
