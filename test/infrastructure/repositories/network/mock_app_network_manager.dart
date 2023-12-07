import 'package:busenet/busenet.dart';
import 'package:flutter_onion_architecture/infrastructure/persistence/network/i_app_network_manager.dart';
import 'package:flutter_onion_architecture/infrastructure/persistence/network/model/response_model.dart';
import 'package:mockito/mockito.dart';

class MockAppNetworkManager extends Mock implements IAppNetworkManager {
  bool _returnFailure = false;
  Failure? _failure;

  void setReturnFailure(bool value, [Failure? failure]) {
    _returnFailure = value;
    _failure = failure;
  }

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
    if (_returnFailure) {
      return ResponseModel(status: 1, statusCode: 1, success: false, errorType: _failure);
    }

    if (R == List<T>) {
      return ResponseModel(
        status: 1,
        statusCode: 1,
        success: true,
        entity: [
          parserModel,
          parserModel,
          parserModel,
        ],
      );
    }

    return ResponseModel(status: 1, statusCode: 1, entity: parserModel);
  }

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
    if (_returnFailure) {
      return ResponseModel(status: 1, statusCode: 1, success: false, errorType: _failure);
    }

    return ResponseModel(status: 1, statusCode: 1, success: true, entity: true);
  }
}
