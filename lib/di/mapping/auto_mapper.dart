import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:flutter_onion_architecture/core/application/dto/product_dto.dart';
import 'package:flutter_onion_architecture/core/application/features/product/commands/create_product/create_product_command.dart';
import 'package:flutter_onion_architecture/core/domain/entities/product.dart';
import 'package:injectable/injectable.dart';

import 'auto_mapper.auto_mappr.dart';

@AutoMappr([
  MapType<CreateProductCommand, Product>(
    fields: [
      Field('title', from: 'description'),
    ],
  ),
  MapType<Product, ProductDto>(),
  MapType<ProductDto, Product>(),
])
@singleton
final class AutoMapper extends $AutoMapper {}
