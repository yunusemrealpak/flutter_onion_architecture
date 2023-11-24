import 'package:flutter_onion_architecture/common/utils/record_utils.dart';
import 'package:flutter_onion_architecture/core/application/dto/product_dto.dart';
import 'package:flutter_onion_architecture/core/application/features/product/queries/get_all_product/get_all_product_query.dart';
import 'package:flutter_onion_architecture/core/application/interfaces/repositories/i_product_repository.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/service_response.dart';
import 'package:flutter_onion_architecture/di/mapping/auto_mapper.dart';
import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

@LazySingleton(as: IRequestHandler)
final class GetAllProductQueryHandler implements IRequestHandler<GetAllProductQuery, ServiceResponse<List<ProductDto>>> {
  final IProductRepository _repository;
  final AutoMapper _mapper;

  GetAllProductQueryHandler(this._repository, this._mapper);

  @override
  Future<ServiceResponse<List<ProductDto>>> handle(GetAllProductQuery request) async {
    final result = await _repository.getAll();

    return result.fold(
      (l) => ServiceResponse.failure(l),
      (r) {
        List<ProductDto> list = _mapper.convertList(r);
        return ServiceResponse.success(list);
      },
    );
  }
}
