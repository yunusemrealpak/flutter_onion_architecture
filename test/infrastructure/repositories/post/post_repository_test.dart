import 'package:busenet/busenet.dart';
import 'package:flutter_onion_architecture/common/utils/record_utils.dart';
import 'package:flutter_onion_architecture/core/application/interfaces/repositories/i_post_repository.dart';
import 'package:flutter_onion_architecture/core/domain/entities/post.dart';
import 'package:flutter_onion_architecture/infrastructure/persistence/repositories/post_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../network/mock_app_network_manager.dart';

void main() {
  late IPostRepository repository;
  late MockAppNetworkManager manager;

  setUp(() {
    manager = MockAppNetworkManager();
    repository = PostRepository(manager);
  });

  group('Post Repository Test', () {
    group('getAll test', () {
      test('should return list products', () async {
        final result = await repository.getAll();
        final products = result.right;

        expect(products.length, 3);
      });

      test('should return failure', () async {
        manager.setReturnFailure(true, NotFoundFailure(message: 'NotFoundFailure'));

        final result = await repository.getAll();
        final failure = result.left;

        expect(failure, isA<NotFoundFailure>());
        expect(failure.message, 'NotFoundFailure');
      });
    });

    group('getById test', () {
      test('should return a product', () async {
        final result = await repository.getById(1);
        final product = result.right;

        expect(product, isNotNull);
      });

      test('should return a failure', () async {
        manager.setReturnFailure(true, NotFoundFailure(message: 'NotFoundFailure'));

        final result = await repository.getById(1);
        final failure = result.left;

        expect(failure, isNotNull);
        expect(failure, isA<NotFoundFailure>());
      });
    });

    group('create product test', () {
      test('should create a product', () async {
        const post = Post(
          id: 1,
          body: 'Product 1',
          title: 'Product 1',
        );

        final result = await repository.create(post);
        final product = result.right;

        expect(product, isNotNull);
      });

      test('should return a failure', () async {
        manager.setReturnFailure(true, NotFoundFailure(message: 'NotFoundFailure'));

        final result = await repository.create(const Post());
        final failure = result.left;

        expect(failure, isNotNull);
        expect(failure, isA<NotFoundFailure>());
      });
    });

    group('update product test', () {
      test('should update a product', () async {
        final result = await repository.update(const Post());
        final product = result.right;

        expect(product, isNotNull);
      });

      test('should return a failure', () async {
        manager.setReturnFailure(true, NotFoundFailure(message: 'NotFoundFailure'));

        final result = await repository.update(const Post());
        final failure = result.left;

        expect(failure, isNotNull);
        expect(failure, isA<NotFoundFailure>());
      });
    });

    group('delete product test', () {
      test('should delete a product', () async {
        final result = await repository.delete(const Post());
        final status = result.right;

        expect(status, isTrue);
      });

      test('should return a failure', () async {
        manager.setReturnFailure(true, NotFoundFailure(message: 'NotFoundFailure'));

        final result = await repository.delete(const Post());
        final failure = result.left;

        expect(failure, isNotNull);
        expect(failure, isA<NotFoundFailure>());
      });
    });
  });
}
