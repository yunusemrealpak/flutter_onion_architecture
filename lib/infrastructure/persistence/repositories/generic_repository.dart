import 'package:busenet/busenet.dart';
import 'package:flutter_onion_architecture/common/extensions/generic_repo_method.dart';
import 'package:flutter_onion_architecture/core/application/interfaces/repositories/i_generic_repository.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/typedefs.dart';
import 'package:flutter_onion_architecture/infrastructure/persistence/network/app_network_manager.dart';
import 'package:flutter_onion_architecture/infrastructure/persistence/network/model/app_failure.dart';
import 'package:flutter_onion_architecture/infrastructure/persistence/network/model/response_model.dart';

import '../../../common/utils/record_utils.dart';
import '../network/i_app_network_manager.dart';

abstract class GenericRepository<T extends BaseEntity<T>> implements IGenericRepository<T> {
  final IAppNetworkManager _manager;
  final T parserModel;
  final Map<GenericRepoMethod, String> networkPaths;

  GenericRepository(this._manager, {required this.parserModel, required this.networkPaths});

  @override
  EitherFuture<List<T>> getAll() async {
    final networkPath = networkPaths[GenericRepoMethod.getAll] ?? '';

    final response = await _manager.fetch<T, List<T>>(
      networkPath,
      type: HttpTypes.get,
      parserModel: parserModel,
      ignoreEntityKey: true,
    );

    if (response.errorType != null) {
      return left(response.errorType!);
    }

    return right(response.entity as List<T>);
  }

  @override
  EitherFuture<T> getById(int id) async {
    final networkPath = networkPaths[GenericRepoMethod.getById] ?? '';

    final response = await _manager.fetch<T, T>(
      networkPath.replaceAll('{id}', '$id'),
      type: HttpTypes.get,
      parserModel: parserModel,
      ignoreEntityKey: true,
      // queryParameters: {'id': id},
    );

    if (response.errorType != null) {
      return left(response.errorType!);
    }

    return right(response.entity as T);
  }
}
