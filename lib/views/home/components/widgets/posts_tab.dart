import 'package:flutter/material.dart';
import 'package:social_network/models/post.dart';
import 'package:social_network/services/database_services.dart';
import 'package:social_network/utilities/size_config.dart';
import 'package:social_network/views/common_widgets/image_loader.dart';

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
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
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
                        imageUrl: post.author.imageUrl,
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
                            post.author.name,
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
                                  text: post.author.name,
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
