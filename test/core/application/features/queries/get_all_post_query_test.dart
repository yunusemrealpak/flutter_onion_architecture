import 'dart:math';

import 'package:busenet/busenet.dart';
import 'package:flutter_onion_architecture/core/application/features/post/queries/get_all_post/get_all_post_query.dart';
import 'package:flutter_onion_architecture/core/application/features/post/queries/get_all_post/get_all_post_query_handler.dart';
import 'package:flutter_onion_architecture/core/application/interfaces/repositories/i_post_repository.dart';
import 'package:flutter_onion_architecture/core/domain/entities/post.dart';
import 'package:flutter_onion_architecture/di/injection/get_it_container.dart';
import 'package:flutter_onion_architecture/di/mapping/auto_mapper.dart';
import 'package:flutter_onion_architecture/infrastructure/persistence/repositories/post_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../infrastructure/repositories/network/mock_app_network_manager.dart';
import 'get_all_post_query_test.mocks.dart';

@GenerateMocks([AutoMapper])
void main() {
  late MockAutoMapper mapper;
  late IPostRepository productRepository;
  late GetAllProductQueryHandler handler;
  late MockAppNetworkManager mockAppNetworkManager;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    GetItContainer.configureDependencies();
    mapper = MockAutoMapper();
    mockAppNetworkManager = MockAppNetworkManager();
    productRepository = PostRepository(mockAppNetworkManager);
    handler = GetAllProductQueryHandler(productRepository, mapper);
  });

  test('should return a list of products', () async {
    // arrange
    final command = GetAllProductQuery();

    // act
    final result = await handler.handle(command);
    when(mapper.convertList(result.data!)).thenReturn(List.generate(2, (index) => Post(id: index, title: 'name $index', body: 'title $index', userId: Random().nextInt(100))));

    // assert
    expect(result.hasData, true, reason: 'should return a list of products');
    expect(result.data?.length, 2, reason: 'should 2 products');
    expect(result.data?.first, isA<Post>(), reason: 'should be a product');
  });

  test('should return error not found', () async {
    // arrange
    final command = GetAllProductQuery();
    mockAppNetworkManager.setReturnFailure(true, NotFoundFailure());

    // act
    final result = await handler.handle(command);

    // assert
    expect(result.hasFailure, true, reason: 'should error not found');
    expect(result.failure, isA<NotFoundFailure>(), reason: 'should error not found');
  });
}
