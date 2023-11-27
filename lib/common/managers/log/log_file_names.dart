// ignore_for_file: constant_identifier_names

/// Enum representing the names of log files.
enum LogFileNames {
  /// Represents the log file.
  log('Log'),

  /// Represents the error log file.
  error_log('Error Log'),

  /// Represents the notification log file.
  notification_log('Notification Log');

  /// The value associated with the enum constant.
  final String value;

  /// Constructor for the enum constant.
  const LogFileNames(this.value);
}
