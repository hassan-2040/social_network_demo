import 'package:flutter/material.dart';
import 'package:social_network/utilities/size_config.dart';
import 'package:social_network/views/common_widgets/image_loader.dart';

class FriendsTab extends StatelessWidget {
  const FriendsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List<Widget>.generate(
            50,
            (index) {
              if (index == 0) {
                return Padding(
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
                );
              } else if (index == 49) {
                return SizedBox(
                  height: SizeConfig.screenHeight * 0.1,
                );
              } else {
                return const FriendsListItem();
              }
            },
          ),
        ),
      ),
    );
  }
}

class FriendsListItem extends StatelessWidget {
  const FriendsListItem({Key? key}) : super(key: key);
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
                imageUrl:
                    'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
                width: 2,
                loadingColor: Colors.grey.shade600,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Firstname Lastname',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Friends since DATE-TIME',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
