import 'package:flutter_onion_architecture/core/application/dto/product_dto.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/service_response.dart';
import 'package:mediatr/mediatr.dart';

final class GetAllProductQuery extends IRequest<ServiceResponse<List<ProductDto>>> {}
