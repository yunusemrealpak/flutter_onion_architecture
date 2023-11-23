import 'package:flutter_onion_architecture/common/utils/record_utils.dart';
import 'package:flutter_onion_architecture/core/application/interfaces/repositories/i_product_repository.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/typedefs.dart';
import 'package:flutter_onion_architecture/core/domain/entities/product.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IProductRepository)
final class ProductRepository implements IProductRepository {
  @override
  EitherFuture<Product> create(Product entity) async {
    return right(entity);
  }

  @override
  EitherFuture<Product> delete(Product entity) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  EitherFuture<List<Product>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  EitherFuture<Product> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  EitherFuture<Product> update(Product entity) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
