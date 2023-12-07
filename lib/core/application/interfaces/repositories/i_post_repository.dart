import 'package:flutter_onion_architecture/core/application/interfaces/repositories/i_generic_repository.dart';

import '../../../domain/entities/post.dart';
import '../../wrappers/typedefs.dart';

abstract interface class IPostRepository implements IGenericRepository<Post> {
  EitherFuture<Post> create(Post entity);
  EitherFuture<Post> update(Post entity);
  EitherFuture<bool> delete(Post entity);
}
