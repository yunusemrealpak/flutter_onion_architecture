import 'package:flutter_onion_architecture/common/utils/record_utils.dart';
import 'package:flutter_onion_architecture/core/application/dto/post_dto.dart';
import 'package:flutter_onion_architecture/core/application/exception/validation_exception.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/service_response.dart';
import 'package:flutter_onion_architecture/core/domain/entities/post.dart';
import 'package:flutter_onion_architecture/di/mapping/auto_mapper.dart';
import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

import '../../../../interfaces/repositories/i_post_repository.dart';
import 'create_post_command.dart';

@LazySingleton(as: IRequestHandler)
final class CreateProductCommandHandler implements IRequestHandler<CreatePostCommand, ServiceResponse<PostDto>> {
  final IPostRepository _productRepository;
  final AutoMapper _mapper;
  CreateProductCommandHandler(this._productRepository, this._mapper);

  @override
  Future<ServiceResponse<PostDto>> handle(CreatePostCommand request) async {
    // Validation
    final (isValid, message) = request.hasValidate();
    if (!isValid) {
      return ServiceResponse.failure(ValidationException(message: message));
    }

    Post product = _mapper.convert(request);
    final result = await _productRepository.create(product);

    return result.fold(
      (l) => ServiceResponse.failure(l!),
      (r) {
        PostDto productDto = _mapper.convert(r);
        return ServiceResponse.success(productDto);
      },
    );
  }
}
