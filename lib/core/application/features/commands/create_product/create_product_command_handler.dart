import 'package:flutter_onion_architecture/common/utils/record_utils.dart';
import 'package:flutter_onion_architecture/core/application/interfaces/repositories/i_product_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mapper_annotation/mapper_annotation.dart';
import 'package:mediatr/mediatr.dart';

import '../../../../domain/entities/product.dart';
import 'create_product_command.dart';

@LazySingleton(as: IRequestHandler)
final class CreateProductCommandHandler implements IRequestHandler<CreateProductCommand, Product> {
  final IProductRepository _productRepository;
  final IMapper _mapper;
  CreateProductCommandHandler(this._productRepository, this._mapper);

  @override
  Future<Product> handle(CreateProductCommand request) async {
    final product = _mapper.map<Product>(request);
    final result = await _productRepository.create(product);

    return result.fold(
      (l) => throw l?.message ?? '$runtimeType Handle Error',
      (r) => r,
    );
  }
}
