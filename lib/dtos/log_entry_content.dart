class LogEntryContent {
  final String divider;
  final String logType;
  final String labelTitle;
  final String title;
  final String labelTime;
  final String time;
  final String labelMessage;
  final String message;
  final String source;
  final String linkText;
  final String url;

  const LogEntryContent({
    this.divider = '|',
    this.logType = ' Error ',
    this.labelTitle = '',
    this.title = '',
    this.labelTime = '',
    this.time = '',
    this.labelMessage = '',
    this.message = '',
    this.source = '',
    this.linkText = '',
    this.url = '',
  });
}
