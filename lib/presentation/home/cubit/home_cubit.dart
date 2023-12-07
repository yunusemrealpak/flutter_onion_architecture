import 'package:flutter_onion_architecture/core/application/dto/post_dto.dart';
import 'package:flutter_onion_architecture/core/application/features/post/commands/create_post/create_post_command.dart';
import 'package:flutter_onion_architecture/core/application/features/post/queries/get_all_post/get_all_post_query.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/service_response.dart';
import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../../common/base_cubit.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends BaseCubit<HomeState> {
  final IMediator _mediator;
  HomeCubit(this._mediator) : super(HomeState.initial());

  /// Initializes the home screen by fetching all products and updating the state accordingly.
  /// If the API call fails, the failure is stored in the state.
  /// If the API call is successful, the retrieved products are stored in the state.
  /// Finally, the loading state is updated to false.
  Future<void> init() async {
    setLoading(true);
    final response = await _mediator.send<GetAllProductQuery, ServiceResponse<List<PostDto>>>(
      GetAllProductQuery(),
    );
    setLoading(false);

    if (response.hasFailure) {
      safeEmit(state.copyWith(failure: response.failure));
      return;
    }

    safeEmit(state.copyWith(posts: response.data ?? []));
  }

  /// Creates a new product.
  ///
  /// This method sends a [CreatePostCommand] to the mediator to create a new product.
  /// It sets the loading state to true, then awaits the response from the mediator.
  /// If the response has a failure, it updates the state with the failure and returns.
  /// Otherwise, it updates the state with the created product and sets the loading state to false.
  ///
  /// Example usage:
  /// ```dart
  /// createProduct();
  /// ```
  Future<void> createProduct() async {
    setLoading(true);
    final response = await _mediator.send<CreatePostCommand, ServiceResponse<PostDto>>(
      CreatePostCommand(
        name: 'Product 1',
        price: 1000,
        title: 'Description 1',
      ),
    );
    setLoading(false);

    if (response.hasFailure) {
      safeEmit(state.copyWith(failure: response.failure));
      return;
    }

    safeEmit(state.copyWith(post: response.data));
  }

  @override
  void setLoading(bool loading) {
    safeEmit(state.copyWith(isLoading: loading));
  }
}
