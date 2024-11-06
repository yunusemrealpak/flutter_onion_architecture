import 'package:flutter_onion_architecture/core/application/dto/post_dto.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/service_response.dart';
import 'package:mediatr/mediatr.dart';

final class CreatePostCommand extends IRequest<ServiceResponse<PostDto>> {
  final String body;
  final String title;

  CreatePostCommand({
    required this.body,
    required this.title,
  });

  @override
  (bool, String?) hasValidate() {
    if (body.isEmpty) {
      return (false, 'Name is required');
    }

    return (true, null);
  }
}
