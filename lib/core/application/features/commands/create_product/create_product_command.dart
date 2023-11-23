import 'package:flutter_onion_architecture/core/domain/entities/product.dart';
import 'package:mapper_annotation/mapper_annotation.dart';
import 'package:mediatr/mediatr.dart';

@Mapper(as: Product, reverseMap: true)
final class CreateProductCommand implements IRequest<Product> {
  final String name;
  final String description;
  final double price;

  CreateProductCommand({
    required this.name,
    required this.description,
    required this.price,
  });
}
