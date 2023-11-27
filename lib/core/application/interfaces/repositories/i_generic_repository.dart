import 'package:flutter_onion_architecture/core/application/wrappers/typedefs.dart';

/// The interface for a generic repository.
/// This interface provides methods to interact with a data source and perform CRUD operations on entities of type [T].
abstract interface class IGenericRepository<T> {
  /// Retrieves an entity by its ID.
  /// Returns an [EitherFuture] that represents the result of the operation.
  /// If the operation is successful, the [EitherFuture] will contain the entity.
  /// If the operation fails, the [EitherFuture] will contain an error.
  EitherFuture<T> getById(int id);

  /// Retrieves all entities.
  /// Returns an [EitherFuture] that represents the result of the operation.
  /// If the operation is successful, the [EitherFuture] will contain a list of entities.
  /// If the operation fails, the [EitherFuture] will contain an error.
  EitherFuture<List<T>> getAll();
}
