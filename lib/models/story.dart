import 'package:social_network/models/user.dart';

class Story {
  final String id;
  final String imageUrl;
  final User author;

  const Story({
    required this.id,
    required this.imageUrl,
    required this.author,
  });
}
