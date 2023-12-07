import 'package:busenet/busenet.dart';
import 'package:flutter_onion_architecture/core/application/dto/post_dto.dart';
import 'package:flutter_onion_architecture/core/application/features/post/commands/create_post/create_post_command.dart';
import 'package:flutter_onion_architecture/core/application/features/post/queries/get_all_post/get_all_post_query.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/service_response.dart';
import 'package:flutter_onion_architecture/presentation/home/cubit/home_cubit.dart';
import 'package:flutter_onion_architecture/presentation/home/cubit/home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mediatr/mediatr.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_cubit_test.mocks.dart';

@GenerateMocks([Mediator])
void main() {
  late HomeCubit cubit;
  late MockMediator mockMediator;

  setUp(() {
    mockMediator = MockMediator();
    cubit = HomeCubit(mockMediator);
  });

  group('HomeCubit', () {
    test('initial state is correct', () {
      expect(cubit.state, HomeState.initial());
    });

    group('init()', () {
      test('updates state correctly', () async {
        final expectedState = HomeState.initial().copyWith(posts: [
          PostDto(
            id: 1,
            userId: 1,
            title: 'Product 1',
            body: 'Product 1',
          ),
          PostDto(
            id: 2,
            userId: 2,
            title: 'Product 2',
            body: 'Product 2',
          ),
        ]);

        when(mockMediator.send<GetAllProductQuery, ServiceResponse<List<PostDto>>>(any)).thenAnswer(
          (_) async => ServiceResponse.success(expectedState.posts),
        );

        await cubit.init();

        expect(cubit.state, expectedState);
      });

      test('updates state correctly when error', () async {
        final expectedState = HomeState.initial().copyWith(failure: NotFoundFailure());

        when(mockMediator.send<GetAllProductQuery, ServiceResponse<List<PostDto>>>(any)).thenAnswer(
          (_) async => ServiceResponse.failure(NotFoundFailure()),
        );

        await cubit.init();

        expect(cubit.state, expectedState);
      });
    });

    group('createProduct()', () {
      test('updates state correctly', () async {
        final expectedState = HomeState.initial().copyWith(
          post: PostDto(
            id: 1,
            userId: 1,
            title: 'Product 1',
            body: 'Product 1',
          ),
        );

        when(mockMediator.send<CreatePostCommand, ServiceResponse<PostDto>>(any)).thenAnswer(
          (_) async => ServiceResponse.success(expectedState.post!),
        );

        await cubit.createProduct();

        expect(cubit.state, expectedState);
      });

      test('updates state correctly when error', () async {
        final expectedState = HomeState.initial().copyWith(failure: NotFoundFailure());

        when(mockMediator.send<CreatePostCommand, ServiceResponse<PostDto>>(any)).thenAnswer(
          (_) async => ServiceResponse.failure(NotFoundFailure()),
        );

        await cubit.createProduct();

        expect(cubit.state, expectedState);
      });
    });
  });
}
