import 'package:busenet/busenet.dart';
import 'package:flutter_onion_architecture/presentation/common/base_cubit_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/application/dto/product_dto.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState extends BaseCubitState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    Failure? failure,

    ///
    @Default([]) List<ProductDto> products,
  }) = _HomeState;
  factory HomeState.initial() => const HomeState();
}
