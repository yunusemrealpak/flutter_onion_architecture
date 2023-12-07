import 'dart:io';

import 'package:busenet/busenet.dart';

import 'model/response_model.dart';

abstract interface class IAppNetworkManager {
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
  });

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
  });

  Future<File> downloadFile(
    String urlPath, {
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    void Function(double)? onReceiveProgressPercentage,
    CancelToken? cancelToken,
  });

  Future<void> get waitForManagerInitialization;

  void changeLangHeader(String langCode);

  void addAuthorizationHeader(String token);
}
