import 'package:flutter_onion_architecture/core/application/dto/product_dto.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/service_response.dart';
import 'package:flutter_onion_architecture/core/domain/entities/product.dart';
import 'package:mapper_annotation/mapper_annotation.dart';
import 'package:mediatr/mediatr.dart';

@Mapper(
  as: Product,
  reverseMap: true,
)
final class CreateProductCommand extends IRequest<ServiceResponse<ProductDto>> {
  final String productName;
  final double productStock;
  final String title;
  final double price;

  CreateProductCommand({
    required this.productName,
    required this.title,
    this.productStock = 0.0,
    this.price = 0.0,
  });

  @override
  (bool, String?) hasValidate() {
    if (productName.isEmpty) {
      return (false, 'Name is required');
    }

    return (true, null);
  }
}
