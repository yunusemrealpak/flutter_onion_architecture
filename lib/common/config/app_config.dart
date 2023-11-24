import 'package:injectable/injectable.dart';

class AppConfig {
  static const String environment = Environment.test;
  static const bool isDebug = true;
  static const int passwordMinLength = 6;

  static const String downloadFolder = "";
}
