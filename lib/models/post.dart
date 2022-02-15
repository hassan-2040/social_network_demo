class Post {
  final String authorName;
  final String authorImageUrl;
  String? caption;
  String? imageUrl;
  int? likesCount;
  int? commentsCount;
  String? locationTag;

  Post({
    required this.authorName,
    required this.authorImageUrl,
    this.caption,
    this.imageUrl,
    this.likesCount,
    this.commentsCount,
    this.locationTag,
  });
}
