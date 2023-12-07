import 'package:flutter_onion_architecture/common/utils/record_utils.dart';
import 'package:flutter_onion_architecture/core/application/dto/post_dto.dart';
import 'package:flutter_onion_architecture/core/application/features/post/queries/get_all_post/get_all_post_query.dart';
import 'package:flutter_onion_architecture/core/application/interfaces/repositories/i_post_repository.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/service_response.dart';
import 'package:flutter_onion_architecture/di/mapping/auto_mapper.dart';
import 'package:injectable/injectable.dart';
import 'package:mediatr/mediatr.dart';

@LazySingleton(as: IRequestHandler)
final class GetAllProductQueryHandler implements IRequestHandler<GetAllProductQuery, ServiceResponse<List<PostDto>>> {
  final IPostRepository _repository;
  final AutoMapper _mapper;

  GetAllProductQueryHandler(this._repository, this._mapper);

  @override
  Future<ServiceResponse<List<PostDto>>> handle(GetAllProductQuery request) async {
    final result = await _repository.getAll();

    return result.fold(
      (l) => ServiceResponse.failure(l!),
      (r) {
        List<PostDto> list = _mapper.convertList(r);
        return ServiceResponse.success(list);
      },
    );
  }
}
