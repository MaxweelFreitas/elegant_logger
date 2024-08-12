import 'package:poc_ml/helpers/x_term/x_term_color.dart';

import '../helpers/elegant_box.dart';

/// Default [tag] printed.
///
/// Output looks like this:
/// ```dart
/// ┤ ⎕ ◻◻◻◻◻ ├
///
/// ```
/// where:
/// ┤        ⇒ is the prefix
/// ⎕       ⇒ is the icon
/// ◻◻◻◻◻ ⇒ is the name
/// ├        ⇒ is the sufix
///
/// and they can all be replaced
class LogLevel {
  final String prefix;
  final String icon;
  final String nameBgColor;
  final String nameColor;
  final String name;
  final String sufix;

  const LogLevel({
    this.prefix = ElegantBox.middleRight,
    this.icon = '',
    this.nameBgColor = XTermColor.reset,
    this.nameColor = XTermColor.white,
    this.name = '',
    this.sufix = ElegantBox.middleLeft,
  });
}
