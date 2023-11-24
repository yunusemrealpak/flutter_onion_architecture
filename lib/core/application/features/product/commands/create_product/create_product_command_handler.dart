import 'package:flutter_onion_architecture/common/utils/record_utils.dart';
import 'package:flutter_onion_architecture/core/application/dto/product_dto.dart';
import 'package:flutter_onion_architecture/core/application/exception/validation_exception.dart';
import 'package:flutter_onion_architecture/core/application/interfaces/repositories/i_product_repository.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/service_response.dart';
import 'package:flutter_onion_architecture/di/mapping/auto_mapper.dart';
import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../../../../../domain/entities/product.dart';
import 'create_product_command.dart';

@LazySingleton(as: IRequestHandler)
final class CreateProductCommandHandler implements IRequestHandler<CreateProductCommand, ServiceResponse<ProductDto>> {
  final IProductRepository _productRepository;
  final AutoMapper _mapper;
  CreateProductCommandHandler(this._productRepository, this._mapper);

  @override
  Future<ServiceResponse<ProductDto>> handle(CreateProductCommand request) async {
    // Validation
    final (isValid, message) = request.hasValidate();
    if (!isValid) {
      return ServiceResponse.failure(ValidationException(message: message));
    }

    Product product = _mapper.convert(request);
    final result = await _productRepository.create(product);

    return result.fold(
      (l) => ServiceResponse.failure(l),
      (r) {
        ProductDto productDto = _mapper.convert(r);
        return ServiceResponse.success(productDto);
      },
    );
  }
}
