import 'package:busenet/busenet.dart';
import 'package:flutter_onion_architecture/core/application/interfaces/repositories/i_generic_repository.dart';
import 'package:flutter_onion_architecture/core/application/interfaces/repositories/i_product_repository.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/typedefs.dart';
import 'package:flutter_onion_architecture/core/domain/entities/product.dart';
import 'package:flutter_onion_architecture/infrastructure/persistence/network/app_network_manager.dart';
import 'package:flutter_onion_architecture/infrastructure/persistence/network/model/app_failure.dart';

import '../../../common/utils/record_utils.dart';

abstract class GenericRepository<T extends BaseEntity<T>> implements IGenericRepository<T> {
  final AppNetworkManager _manager;
  final T parserModel;
  final Map<String, String> networkPaths;

  GenericRepository(this._manager, {required this.parserModel, required this.networkPaths});

  @override
  EitherFuture<List<T>> getAll() async {
    final networkPath = networkPaths['getAll'] ?? '';

    final response = await _manager.fetch<T, List<T>>(
      networkPath,
      type: HttpTypes.get,
      parserModel: parserModel,
    );

    switch (response.statusCode) {
      case 1:
        final status = response.success ?? false;
        if (!status) return left(AppFailure(message: response.errorMessage));

        return right(response.entity as List<T>);
      default:
        return left(AppFailure(message: response.errorMessage));
    }
  }

  @override
  EitherFuture<T> getById(int id) async {
    final networkPath = networkPaths['getById'] ?? '';

    final response = await _manager.fetch<T, T>(
      networkPath,
      type: HttpTypes.get,
      parserModel: parserModel,
      queryParameters: {'id': id},
    );

    switch (response.statusCode) {
      case 1:
        final status = response.success ?? false;
        if (!status) return left(AppFailure(message: response.errorMessage));

        return right(response.entity as T);
      default:
        return left(AppFailure(message: response.errorMessage));
    }
  }
}
