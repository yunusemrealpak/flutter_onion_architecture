import 'package:flutter_onion_architecture/core/application/dto/post_dto.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/service_response.dart';
import 'package:mediatr/mediatr.dart';

class GetAllProductQuery extends IRequest<ServiceResponse<List<PostDto>>> {}
