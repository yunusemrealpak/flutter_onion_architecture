import 'package:flutter_onion_architecture/core/application/interfaces/repositories/i_generic_repository.dart';

import '../../../domain/entities/product.dart';
import '../../wrappers/typedefs.dart';

abstract interface class IProductRepository implements IGenericRepository<Product> {
  EitherFuture<Product> create(Product entity);
  EitherFuture<Product> update(Product entity);
  EitherFuture<Product> delete(Product entity);
}
