import 'package:busenet/busenet.dart';
import 'package:flutter_onion_architecture/common/extensions/generic_repo_method.dart';
import 'package:flutter_onion_architecture/common/utils/record_utils.dart';
import 'package:flutter_onion_architecture/core/application/interfaces/repositories/i_post_repository.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/typedefs.dart';
import 'package:flutter_onion_architecture/core/domain/entities/post.dart';
import 'package:flutter_onion_architecture/infrastructure/persistence/network/app_network_manager.dart';
import 'package:flutter_onion_architecture/infrastructure/persistence/network/network_paths.dart';
import 'package:injectable/injectable.dart';

import '../network/i_app_network_manager.dart';
import '../network/model/app_failure.dart';
import 'generic_repository.dart';

@LazySingleton(as: IPostRepository)
class PostRepository extends GenericRepository<Post> implements IPostRepository {
  IAppNetworkManager manager;
  PostRepository(this.manager)
      : super(manager, parserModel: const Post(), networkPaths: {
          GenericRepoMethod.getAll: "/posts",
          GenericRepoMethod.getById: "/posts/{id}",
        });

  @override
  EitherFuture<Post> create(Post entity) async {
    final response = await manager.fetch<Post, Post>(
      NetworkPaths.createPost,
      type: HttpTypes.post,
      parserModel: const Post(),
      data: entity.toJson(),
    );

    if (response.errorType != null) {
      return left(response.errorType!);
    }

    return right(response.entity as Post);
  }

  @override
  EitherFuture<bool> delete(Post entity) async {
    final response = await manager.fetchPrimitive<NoResultResponse, NoResultResponse>(
      NetworkPaths.deletePost.replaceAll('{id}', '${entity.id}'),
      type: HttpTypes.delete,
    );

    if (response.errorType != null) {
      return left(response.errorType!);
    }

    return right(true);
  }

  @override
  EitherFuture<Post> update(Post entity) async {
    final response = await manager.fetch<Post, Post>(
      NetworkPaths.updatePost.replaceAll('{id}', '${entity.id}'),
      type: HttpTypes.put,
      parserModel: const Post(),
      data: entity.toJson(),
    );

    if (response.errorType != null) {
      return left(response.errorType!);
    }

    return right(response.entity as Post);
  }
}
