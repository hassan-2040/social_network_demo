import 'package:flutter/material.dart';

class GroupsTab extends StatelessWidget {
  const GroupsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: List<GroupsListItem>.generate(
            50,
            (_) => const GroupsListItem(),
          ),
        ),
      ),
    );
  }
}

class GroupsListItem extends StatelessWidget {
  const GroupsListItem({Key? key}) : super(key: key);

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
          tileColor: Colors.blueGrey,
          leading: const Icon(Icons.group),
          title: const Text('Group name'),
          subtitle: const Text(
              'Group description will be placed here and will contain a short summary about the group.'),
        ),
      ),
    );
  }
}
