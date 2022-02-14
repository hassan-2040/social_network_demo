import 'package:flutter/material.dart';

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: List<NotificationsListItem>.generate(
            50,
            (_) => const NotificationsListItem(),
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
            child: Icon(Icons.group),
          ),
          tileColor: Colors.grey,
          title: const Text('You have received a new notification'),
          onTap: () {},
        ),
      ),
    );
  }
}