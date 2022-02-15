import 'package:flutter/material.dart';
import 'package:social_network/models/user.dart';
import 'package:social_network/services/database_services.dart';
import 'package:social_network/utilities/size_config.dart';
import 'package:social_network/views/common_widgets/image_loader.dart';

class VideosTab extends StatelessWidget {
  const VideosTab({Key? key}) : super(key: key);

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
                'Recent Videos',
                style: TextStyle(
                  fontSize: SizeConfig.textSizeMainHeading * 1.2,
                  color: Colors.grey,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.1),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return VideosListItem(user: users[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class VideosListItem extends StatelessWidget {
  final User user;
  const VideosListItem({
    required this.user,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(25),
                    child: ImageLoader(
                      imageUrl: user.imageUrl,
                      placeHolderSize: const Size.fromRadius(25),
                      placeholderWidget: Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: TextStyle(
                          fontSize: SizeConfig.textSizeNormal,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.01),
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
                Icon(
                  Icons.more_horiz_outlined,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          const Text('Video caption will come here.'),
          Container(
            height: SizeConfig.screenHeight * 0.6,
            width: double.infinity,
            color: Colors.grey.shade900,
            child: Icon(
              Icons.play_circle_outline,
              size: 60,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
