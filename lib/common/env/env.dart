// ignore_for_file: non_constant_identifier_names

import 'package:envied/envied.dart';
import 'package:flutter_onion_architecture/common/config/app_config.dart';

part 'env.g.dart';

class AppEnv {
  static String get apiUrl {
    if (AppConfig.isDebug) return _DevEnv.API_URL;

    return _ProdEnv.API_URL;
  }

  static String get onesignalAppId {
    if (AppConfig.isDebug) return _DevEnv.ONESIGNAL_APP_ID;

    return _ProdEnv.ONESIGNAL_APP_ID;
  }
}

@Envied(path: '.env.dev')
abstract class _DevEnv {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static String API_URL = __DevEnv.API_URL;
  @EnviedField(varName: 'ONESIGNAL_APP_ID', obfuscate: true)
  static String ONESIGNAL_APP_ID = __DevEnv.ONESIGNAL_APP_ID;
}

@Envied(path: '.env')
abstract class _ProdEnv {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static String API_URL = __ProdEnv.API_URL;
  @EnviedField(varName: 'ONESIGNAL_APP_ID', obfuscate: true)
  static String ONESIGNAL_APP_ID = __ProdEnv.ONESIGNAL_APP_ID;
}
