import 'package:flutter_onion_architecture/core/application/dto/product_dto.dart';
import 'package:flutter_onion_architecture/core/application/features/product/commands/create_product/create_product_command.dart';
import 'package:flutter_onion_architecture/core/application/features/product/queries/get_all_product/get_all_product_query.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/service_response.dart';
import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../../common/base_cubit.dart';
import 'home_state.dart';

@injectable
final class HomeCubit extends BaseCubit<HomeState> {
  final IMediator _mediator;
  HomeCubit(this._mediator) : super(HomeState.initial());

  /// Initializes the home screen by fetching all products and updating the state accordingly.
  /// If the API call fails, the failure is stored in the state.
  /// If the API call is successful, the retrieved products are stored in the state.
  /// Finally, the loading state is updated to false.
  void init() async {
    setLoading(true);

    final response = await _mediator.send<GetAllProductQuery, ServiceResponse<List<ProductDto>>>(
      GetAllProductQuery(),
    );

    if (response.hasFailure) {
      safeEmit(state.copyWith(failure: response.failure));
      return;
    }

    safeEmit(state.copyWith(products: response.data ?? []));

    setLoading(false);
  }

  /// Creates a new product.
  ///
  /// This method sends a [CreateProductCommand] to the mediator to create a new product.
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

    final response = await _mediator.send<CreateProductCommand, ServiceResponse<ProductDto>>(
      CreateProductCommand(
        name: 'Product 1',
        price: 1000,
        title: 'Description 1',
      ),
    );

    if (response.hasFailure) {
      safeEmit(state.copyWith(failure: response.failure));
      return;
    }

    safeEmit(state.copyWith(product: response.data));

    setLoading(false);
  }

  @override
  void setLoading(bool loading) {
    safeEmit(state.copyWith(isLoading: loading));
  }
}
