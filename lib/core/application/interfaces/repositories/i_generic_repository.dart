import 'package:flutter_onion_architecture/core/application/wrappers/typedefs.dart';

abstract interface class IGenericRepository<T> {
  EitherFuture<T> getById(int id);
  EitherFuture<List<T>> getAll();
}
