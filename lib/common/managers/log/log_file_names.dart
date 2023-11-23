// ignore_for_file: constant_identifier_names

enum LogFileNames {
  log('Log'),
  error_log('Error Log'),
  notification_log('Notification Log');

  final String value;
  const LogFileNames(this.value);
}
