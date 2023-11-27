import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'log_file_names.dart';

/// A class that provides logging functionality.
///
/// The [LogManager] class contains a static method, [log], which can be used to log messages to a file.
/// The log messages are appended to a text file specified by the [fileName] parameter.
/// If the file does not exist, it will be created.
/// The log message includes the current date and time, followed by the provided [message].
/// The log file is stored in the application's documents directory.
///
/// Example usage:
/// ```dart
/// await LogManager.log('An error occurred', fileName: LogFileNames.error);
/// ```
class LogManager {
  /// Logs the provided [message] to a file.
  ///
  /// The [message] parameter represents the log message to be written to the file.
  /// The [fileName] parameter specifies the name of the log file.
  /// By default, the log file is named 'log.txt'.
  ///
  /// Example usage:
  /// ```dart
  /// await LogManager.log('An error occurred', fileName: LogFileNames.error);
  /// ```
  static Future<void> log(String message, {LogFileNames fileName = LogFileNames.log}) async {
    final details = '${DateTime.now()}: $message\n';
    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final errorFile = File('$appDocPath/${fileName.name}.txt');

    if (!errorFile.existsSync()) {
      errorFile.createSync();
    }

    errorFile.writeAsStringSync(details, mode: FileMode.append);
  }
}
