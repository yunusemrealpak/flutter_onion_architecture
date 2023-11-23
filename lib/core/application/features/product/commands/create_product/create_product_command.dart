import 'package:flutter_onion_architecture/core/application/dto/product_dto.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/service_response.dart';
import 'package:flutter_onion_architecture/core/domain/entities/product.dart';
import 'package:mapper_annotation/mapper_annotation.dart';
import 'package:mediatr/mediatr.dart';

@Mapper(as: Product, reverseMap: true)
final class CreateProductCommand implements IRequest<ServiceResponse<ProductDto>> {
  final String name;
  final String description;
  final double price;

  CreateProductCommand({
    required this.name,
    required this.description,
    required this.price,
  });
}
