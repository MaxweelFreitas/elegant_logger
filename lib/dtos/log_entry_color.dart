import '../helpers/x_term/x_term_color.dart';

class LogEntryColor {
  final String dividerColor;
  final String logTypeColor;
  final String labelTitleColor;
  final String titleColor;
  final String labelTimeColor;
  final String labelMessageColor;
  final String messageColor;
  final String sourceColor;
  final String timeColor;

  const LogEntryColor({
    this.dividerColor = XTermColor.red,
    this.logTypeColor = XTermColor.red,
    this.labelTitleColor = XTermColor.red,
    this.titleColor = XTermColor.red,
    this.labelTimeColor = XTermColor.red,
    this.timeColor = '',
    this.labelMessageColor = XTermColor.red,
    this.messageColor = XTermColor.white,
    this.sourceColor = XTermColor.white,
  });
}
