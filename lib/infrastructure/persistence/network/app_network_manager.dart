import 'dart:async';
import 'dart:io';

import 'package:busenet/busenet.dart';
import 'package:injectable/injectable.dart';

import '../../../common/config/app_config.dart';
import '../../../common/env/env.dart';
import 'model/response_model.dart';

@singleton
class AppNetworkManager {
  late final INetworkManager<ResponseModel> _manager;
  AppNetworkManager(this._manager) {
    init();
  }

  Completer<void> initializeCompleter = Completer<void>();

  Future<void> init() async {
    await _manager.initialize(
      NetworkConfiguration(
        AppEnv.apiUrl,
        // errorMessages: ErrorMessages(
        //   timeoutErrorMessage: LocaleKeys.error_network_timeout.tr(),
        //   connectionErrorMessage: LocaleKeys.error_network_connection.tr(),
        //   cancelErrorMessage: LocaleKeys.error_network_cancel.tr(),
        //   serverErrorMessage: LocaleKeys.error_network_server.tr(),
        //   unknownErrorMessage: LocaleKeys.error_network_unknown.tr(),
        //   unAuthorizedErrorMessage: LocaleKeys.error_network_unauthorized.tr(),
        //   notFoundErrorMessage: LocaleKeys.error_network_not_found.tr(),
        // ),
        downloadFolder: AppConfig.downloadFolder,
      ),
      responseModel: ResponseModel(),
      entityKey: 'entity',
    );
    initializeCompleter.complete();
  }

  Future<ResponseModel> fetch<T extends BaseEntity<T>, R>(
    String path, {
    required T parserModel,
    required HttpTypes type,
    String contentType = Headers.jsonContentType,
    ResponseType responseType = ResponseType.json,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    CachePolicy cachePolicy = CachePolicy.noCache,
    Duration? maxStale,
    bool ignoreEntityKey = false,
    String? insideEntityKey,
  }) async {
    await waitForManagerInitialization;

    return _manager.fetch<T, R>(
      path,
      parserModel: parserModel,
      type: type,
      cachePolicy: cachePolicy,
      cancelToken: cancelToken,
      contentType: contentType,
      data: data,
      maxStale: maxStale,
      onSendProgress: onSendProgress,
      queryParameters: queryParameters,
      responseType: responseType,
      ignoreEntityKey: ignoreEntityKey,
      insideEntityKey: insideEntityKey,
    );
  }

  Future<ResponseModel> fetchPrimitive<T, R>(
    String path, {
    required HttpTypes type,
    String contentType = Headers.jsonContentType,
    ResponseType responseType = ResponseType.json,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    CachePolicy cachePolicy = CachePolicy.noCache,
    Duration? maxStale,
    bool ignoreEntityKey = false,
    String? insideEntityKey,
  }) async {
    await waitForManagerInitialization;

    return _manager.fetchPrimitive<T, R>(
      path,
      type: type,
      cachePolicy: cachePolicy,
      cancelToken: cancelToken,
      contentType: contentType,
      data: data,
      maxStale: maxStale,
      onSendProgress: onSendProgress,
      queryParameters: queryParameters,
      responseType: responseType,
      ignoreEntityKey: ignoreEntityKey,
      insideEntityKey: insideEntityKey,
    );
  }

  Future<File> downloadFile(
    String urlPath, {
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    void Function(double)? onReceiveProgressPercentage,
    CancelToken? cancelToken,
  }) async {
    await waitForManagerInitialization;

    return _manager.downloadFile(
      urlPath,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      onReceiveProgressPercentage: onReceiveProgressPercentage,
      cancelToken: cancelToken,
    );
  }

  Future<void> get waitForManagerInitialization async {
    if (!initializeCompleter.isCompleted) {
      await initializeCompleter.future;
    }
  }

  void changeLangHeader(String langCode) {
    _manager.removeHeader('Lang');
    _manager.addHeader({'Lang': langCode});
  }

  void addAuthorizationHeader(String token) {
    _manager.removeAuthorizationHeader();
    _manager.addAuthorizationHeader(token);
  }
}
