import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:flutter_onion_architecture/core/application/dto/post_dto.dart';
import 'package:flutter_onion_architecture/core/application/features/post/commands/create_post/create_post_command.dart';
import 'package:flutter_onion_architecture/core/domain/entities/post.dart';
import 'package:injectable/injectable.dart';

import 'auto_mapper.auto_mappr.dart';

@AutoMappr([
  MapType<CreatePostCommand, Post>(
    fields: [
      Field('title', from: 'description'),
    ],
  ),
  MapType<Post, PostDto>(),
  MapType<PostDto, Post>(),
])
@singleton
class AutoMapper extends $AutoMapper {}
