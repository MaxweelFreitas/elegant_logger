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
/// ├        ⇒ is the prefix
///
/// and they can all be replaced
class TagType {
  final String prefix;
  final String icon;
  final String nameBgColor;
  final String nameColor;
  final String name;
  final String sufix;

  TagType({
    this.prefix = ElegantBox.middleRight,
    this.icon = ElegantBox.noEmoji,
    this.nameBgColor = XTermColor.reset,
    this.nameColor = XTermColor.white,
    this.name = 'TAG',
    this.sufix = ElegantBox.middleLeft,
  });
}
