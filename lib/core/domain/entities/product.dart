import 'package:flutter_onion_architecture/core/domain/common/base_entity.dart';

final class Product extends BaseEntity {
  final String? name;
  final String? description;
  final double? price;

  Product({
    this.name,
    this.description,
    this.price,
  });
}
