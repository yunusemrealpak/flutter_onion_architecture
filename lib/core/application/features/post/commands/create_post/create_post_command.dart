import 'package:flutter_onion_architecture/core/application/dto/post_dto.dart';
import 'package:flutter_onion_architecture/core/application/wrappers/service_response.dart';
import 'package:mediatr/mediatr.dart';

final class CreatePostCommand extends IRequest<ServiceResponse<PostDto>> {
  final String name;
  final double stock;
  final String title;
  final double price;

  CreatePostCommand({
    required this.name,
    required this.title,
    this.stock = 0.0,
    this.price = 0.0,
  });

  @override
  (bool, String?) hasValidate() {
    if (name.isEmpty) {
      return (false, 'Name is required');
    }

    return (true, null);
  }
}
