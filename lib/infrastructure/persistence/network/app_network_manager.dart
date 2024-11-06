import 'dart:async';
import 'dart:io';

import 'package:busenet/busenet.dart';
import 'package:injectable/injectable.dart';

import '../../../common/config/app_config.dart';
import '../../../common/env/env.dart';
import 'i_app_network_manager.dart';
import 'model/response_model.dart';

@Singleton(as: IAppNetworkManager)

/// A class that manages network operations for the application.
/// It provides methods for fetching data, downloading files, and managing headers.
class AppNetworkManager implements IAppNetworkManager {
  late final INetworkManager<ResponseModel> _manager;

  /// Creates an instance of [AppNetworkManager] with the given [_manager].
  /// It also initializes the network manager by calling [init] method.
  AppNetworkManager(this._manager) {
    init();
  }

  Completer<void> initializeCompleter = Completer<void>();

  /// Initializes the network manager by calling the [_manager]'s [initialize] method.
  /// It sets the network configuration, response model, and entity key.
  Future<void> init() async {
    await _manager.initialize(
      NetworkConfiguration(
        AppEnv.apiUrl,
        downloadFolder: AppConfig.downloadFolder,
      ),
      responseModel: ResponseModel(),
      entityKey: 'entity',
    );
    initializeCompleter.complete();
  }

  /// Fetches data from the network using the [_manager]'s [fetch] method.
  /// It requires a [path] to specify the API endpoint and a [parserModel] to parse the response.
  /// Other optional parameters can be provided for customization.
  @override
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

  /// Fetches primitive data from the network using the [_manager]'s [fetchPrimitive] method.
  /// It requires a [path] to specify the API endpoint.
  /// Other optional parameters can be provided for customization.
  @override
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

  /// Downloads a file from the network using the [_manager]'s [downloadFile] method.
  /// It requires a [urlPath] to specify the file URL.
  /// Other optional parameters can be provided for customization.
  @override
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

  /// Waits for the network manager to initialize by waiting for the [initializeCompleter] to complete.
  @override
  Future<void> get waitForManagerInitialization async {
    if (!initializeCompleter.isCompleted) {
      await initializeCompleter.future;
    }
  }

  /// Changes the language header of the network manager to the specified [langCode].
  @override
  void changeLangHeader(String langCode) {
    _manager.removeHeader('Lang');
    _manager.addHeader({'Lang': langCode});
  }

  /// Adds an authorization header to the network manager with the specified [token].
  @override
  void addAuthorizationHeader(String token) {
    _manager.removeAuthorizationHeader();
    _manager.addAuthorizationHeader(token);
  }
}
