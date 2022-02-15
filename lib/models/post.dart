import 'package:social_network/models/user.dart';

class Post {
  final User author;
  String? caption;
  String? imageUrl;
  int? likesCount;
  int? commentsCount;
  String? locationTag;

  Post({
    required this.author,
    this.caption,
    this.imageUrl,
    this.likesCount,
    this.commentsCount,
    this.locationTag,
  });
}
