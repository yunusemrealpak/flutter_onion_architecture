import 'package:flutter_onion_architecture/common/utils/record_utils.dart';
import 'package:flutter_onion_architecture/core/application/interfaces/repositories/i_product_repository.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/typedefs.dart';
import 'package:flutter_onion_architecture/core/domain/entities/product.dart';
import 'package:flutter_onion_architecture/infrastructure/persistence/network/app_network_manager.dart';
import 'package:injectable/injectable.dart';

import 'generic_repository.dart';

@LazySingleton(as: IProductRepository)
final class ProductRepository extends GenericRepository<Product> implements IProductRepository {
  AppNetworkManager manager;
  ProductRepository(this.manager)
      : super(manager, parserModel: Product(), networkPaths: {
          "getAll": "/api/product/getAll",
          "getById": "/api/product/getById",
        });

  @override
  EitherFuture<Product> create(Product entity) async {
    return right(entity);
  }

  @override
  EitherFuture<Product> delete(Product entity) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  EitherFuture<Product> update(Product entity) async {
    // TODO: implement update
    throw UnimplementedError();
  }
}
