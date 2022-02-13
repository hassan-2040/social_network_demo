import 'package:flutter/material.dart';
import 'package:social_network/utilities/size_config.dart';

class FriendsTab extends StatelessWidget {
  const FriendsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: List<FriendsListItem>.generate(
            50,
            (_) => const FriendsListItem(),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Firstname Lastname',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                'Friends since DATE-TIME',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
