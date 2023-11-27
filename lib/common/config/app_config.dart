import 'package:injectable/injectable.dart';

/// Configuration class for the application.
class AppConfig {
  /// The environment in which the application is running.
  static const String environment = Environment.test;

  /// Flag indicating whether the application is in debug mode.
  static const bool isDebug = true;

  /// The minimum length for a password.
  static const int passwordMinLength = 6;

  /// The folder path for downloading files.
  static const String downloadFolder = "";
}
