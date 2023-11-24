import 'package:flutter_onion_architecture/core/application/dto/product_dto.dart';
import 'package:flutter_onion_architecture/core/application/features/product/commands/create_product/create_product_command.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/service_response.dart';
import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../../common/base_cubit.dart';
import 'home_state.dart';

@injectable
final class HomeCubit extends BaseCubit<HomeState> {
  final IMediator _mediator;
  HomeCubit(this._mediator) : super(HomeState.initial());

  void init() async {
    setLoading(true);

    final response = await _mediator.send<CreateProductCommand, ServiceResponse<ProductDto>>(
      CreateProductCommand(
        productName: 'Product 1',
        price: 1000,
        title: 'Description 1',
      ),
    );

    if (response.hasFailure) {
      safeEmit(state.copyWith(failure: response.failure));
      return;
    }

    safeEmit(state.copyWith());

    setLoading(false);
  }

  @override
  void setLoading(bool loading) {
    safeEmit(state.copyWith(isLoading: loading));
  }
}
