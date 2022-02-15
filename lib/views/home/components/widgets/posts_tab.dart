import 'package:flutter/material.dart';
import 'package:social_network/models/post.dart';
import 'package:social_network/utilities/size_config.dart';
import 'package:social_network/views/common_widgets/image_loader.dart';

final List<Post> _posts = [
  Post(
    authorName: 'Fredrick Hendrickson',
    authorImageUrl:
        'https://images.unsplash.com/photo-1634727898501-a76b30bc2c9a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1187&q=80',
    imageUrl:
        'https://images.unsplash.com/photo-1618742635442-be3ac353a7e5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1250&q=80',
    likesCount: 12,
    commentsCount: 5,
    caption: 'This is a beautiful day in Portland!',
  ),
  Post(
    authorName: 'Pink Floyd',
    authorImageUrl:
        'https://images.unsplash.com/photo-1634727898501-a76b30bc2c9a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1187&q=80',
    likesCount: 5,
    commentsCount: 0,
    caption:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
  ),
  Post(
    authorName: 'Brother Jamie',
    authorImageUrl:
        'https://images.unsplash.com/photo-1634727898501-a76b30bc2c9a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1187&q=80',
    commentsCount: 10,
    locationTag: 'Portland, OR',
  ),
  Post(
    authorName: 'Geralt of Rivia',
    authorImageUrl:
        'https://images.unsplash.com/photo-1634727898501-a76b30bc2c9a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1187&q=80',
    imageUrl:
        'https://images.unsplash.com/photo-1632243985694-aebda88eb37d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1132&q=80',
  ),
  Post(
    authorName: 'Mayweather Hurricane',
    authorImageUrl:
        'https://images.unsplash.com/photo-1634727898501-a76b30bc2c9a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1187&q=80',
    likesCount: 5,
    commentsCount: 6,
    imageUrl:
        'https://images.unsplash.com/photo-1643720375812-7a09248a4f52?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
    caption:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
  ),
];

class PostsTab extends StatelessWidget {
  const PostsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
              child: Text(
                'Recent Posts',
                style: TextStyle(
                  fontSize: SizeConfig.textSizeMainHeading * 1.2,
                  color: Colors.grey,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                final post = _posts[index];
                return PostsListItem(post: post);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PostsListItem extends StatelessWidget {
  final Post post;
  const PostsListItem({
    required this.post,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        color: Colors.grey.shade900,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(25),
                      child: ImageLoader(
                        imageUrl: post.authorImageUrl,
                        width: 2,
                        loadingColor: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: post.locationTag == null,
                          child: Text(
                            post.authorName,
                            style: TextStyle(
                              fontSize: SizeConfig.textSizeNormal,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: post.locationTag != null,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: post.authorName,
                                  style: TextStyle(
                                    fontSize: SizeConfig.textSizeNormal,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text: ' was at ',
                                  style: TextStyle(
                                    fontSize: SizeConfig.textSizeNormal,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text: post.locationTag,
                                  style: TextStyle(
                                    fontSize: SizeConfig.textSizeNormal,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '21 May 2020',
                          style: TextStyle(
                            fontSize: SizeConfig.textSizeSmall,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.more_horiz_outlined,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            Visibility(
              visible: post.caption != null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  post.caption ?? '',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: SizeConfig.textSizeLarge,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: post.imageUrl != null,
              child: Container(
                height: SizeConfig.screenHeight * 0.6,
                width: double.infinity,
                color: Colors.grey.shade900,
                child: ImageLoader(
                  imageUrl: post.imageUrl ?? '',
                  width: 4,
                  loadingColor: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
