// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:busenet/busenet.dart';
import 'package:flutter_onion_architecture/core/domain/common/entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post implements BaseEntity<Post>, Entity {
  const factory Post({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) = _Post;
  const Post._();
  factory Post.initial() => const Post();
  factory Post.fromJson(Map<String, dynamic> data) => _$PostFromJson(data);

  @override
  Post fromJson(dynamic data) => Post.fromJson(data as Map<String, dynamic>);
}
