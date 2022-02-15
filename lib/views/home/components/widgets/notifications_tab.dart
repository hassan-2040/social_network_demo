import 'package:flutter/material.dart';
import 'package:social_network/utilities/size_config.dart';

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({Key? key}) : super(key: key);

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
                    'Your Notifications',
                    style: TextStyle(
                      fontSize: SizeConfig.textSizeMainHeading * 1.2,
                      color: Colors.grey,
                    ),
                  ),
                );
              } else {
                return const NotificationsListItem();
              }
            },
          ),
        ),
      ),
    );
  }
}

class NotificationsListItem extends StatelessWidget {
  const NotificationsListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        child: ListTile(
          visualDensity: VisualDensity.comfortable,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          leading: const CircleAvatar(
            child: Icon(Icons.lightbulb),
          ),
          tileColor: Colors.grey,
          title: const Text('You have received a new notification'),
          onTap: () {},
        ),
      ),
    );
  }
}
