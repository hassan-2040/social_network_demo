import 'package:flutter/material.dart';
import 'package:social_network/models/user.dart';
import 'package:social_network/services/database_services.dart';
import 'package:social_network/utilities/size_config.dart';
import 'package:social_network/views/common_widgets/image_loader.dart';

class FriendsTab extends StatelessWidget {
  const FriendsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0,
            ),
            child: Text(
              'Your friends',
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: _FriendsListItem(
                  user: users[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FriendsListItem extends StatelessWidget {
  final User user;
  const _FriendsListItem({
    required this.user,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(30),
              child: ImageLoader(
                imageUrl: user.imageUrl,
                placeHolderSize: const Size.fromRadius(30),
                placeholderWidget: Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                const Text(
                  'Friends since 25 June 2019',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.more_vert,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
