import 'package:busenet/busenet.dart';
import 'package:flutter_onion_architecture/core/application/dto/post_dto.dart';
import 'package:flutter_onion_architecture/core/application/exception/validation_exception.dart';
import 'package:flutter_onion_architecture/core/application/features/post/commands/create_post/create_post_command.dart';
import 'package:flutter_onion_architecture/core/application/features/post/commands/create_post/create_post_command_handler.dart';
import 'package:flutter_onion_architecture/core/application/interfaces/repositories/i_post_repository.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/service_response.dart';
import 'package:flutter_onion_architecture/core/domain/entities/post.dart';
import 'package:flutter_onion_architecture/di/mapping/auto_mapper.dart';
import 'package:flutter_onion_architecture/infrastructure/persistence/repositories/post_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../infrastructure/repositories/network/mock_app_network_manager.dart';
import 'create_post_command_test.mocks.dart';

@GenerateMocks([AutoMapper])
void main() {
  late MockAutoMapper mapper;
  late IPostRepository productRepository;
  late CreateProductCommandHandler handler;
  late MockAppNetworkManager mockAppNetworkManager;

  setUpAll(() {
    mapper = MockAutoMapper();
    mockAppNetworkManager = MockAppNetworkManager();
    productRepository = PostRepository(mockAppNetworkManager);
    handler = CreateProductCommandHandler(productRepository, mapper);
  });

  test('should create product', () async {
    // arrange
    final command = CreatePostCommand(
      body: 'product name',
      title: 'product title',
    );
    when(mapper.convert(command)).thenReturn(Post.initial());
    when(mapper.convert(const Post())).thenReturn(PostDto());

    // act
    final result = await handler.handle(command);

    // assert
    expect(result.hasData, true);
  });

  test('should return validation exception', () async {
    // arrange
    final command = CreatePostCommand(
      body: '',
      title: '',
    );

    // act
    final result = await handler.handle(command);

    // assert
    expect(result.failure, isA<ValidationException>());
    expect(result.hasFailure, true);
  });

  test('should return error not found', () async {
    // arrange
    final command = CreatePostCommand(
      body: 'Post 1',
      title: 'Post 1',
    );
    when(mapper.convert(command)).thenReturn(Post.initial());
    when(mapper.convert(const Post())).thenReturn(PostDto());
    mockAppNetworkManager.setReturnFailure(
        true, NotFoundFailure(message: 'NotFoundFailure'));

    // act
    final result = await handler.handle(command);

    // assert
    expect(result, isA<ServiceResponse>());
    expect(result.hasFailure, true);
    expect(result.failure, isA<NotFoundFailure>());
  });
}
