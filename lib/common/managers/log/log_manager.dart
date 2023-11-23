import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'log_file_names.dart';

class LogManager {
  static Future<void> log(String message, {LogFileNames fileName = LogFileNames.log}) async {
    final details = '${DateTime.now()}: $message\n';
    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final errorFile = File('$appDocPath/${fileName.name}.txt');

    // Dosyanın var olup olmadığını kontrol edin, yoksa oluşturun.
    if (!errorFile.existsSync()) {
      errorFile.createSync();
    }

    // Hata bilgilerini dosyaya ekleyin.
    errorFile.writeAsStringSync(details, mode: FileMode.append);
  }
}
