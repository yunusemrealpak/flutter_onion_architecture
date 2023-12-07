import 'package:flutter_onion_architecture/core/domain/entities/post.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Post Entity Test', () {
    test('Post fromJson constructor', () {
      final jsonData = {"id": 1, "title": "Post 1", "body": "Post 1", "userId": 1};

      final post = Post.fromJson(jsonData);

      expect(post.id, 1);
      expect(post.title, "Post 1");
      expect(post.body, "Post 1");
      expect(post.userId, 1);
    });

    test('Post fromJson method', () {
      final jsonData = {"id": 1, "title": "Post 1", "body": "Post 1", "userId": 1};

      final post = const Post().fromJson(jsonData);

      expect(post.id, 1);
      expect(post.title, "Post 1");
      expect(post.body, "Post 1");
      expect(post.userId, 1);
    });

    test('Post toJson', () {
      const post = Post(id: 1, title: "Post 1", body: "Post 1", userId: 1);

      final jsonData = post.toJson();

      expect(jsonData['id'], 1);
      expect(jsonData['title'], "Post 1");
      expect(jsonData['body'], "Post 1");
      expect(jsonData['userId'], 1);
    });
  });
}
