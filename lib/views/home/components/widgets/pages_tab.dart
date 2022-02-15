import 'package:flutter/material.dart';
import 'package:social_network/utilities/size_config.dart';

class PagesTab extends StatelessWidget {
  const PagesTab({Key? key}) : super(key: key);

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
                    'Pages you Liked',
                    style: TextStyle(
                      fontSize: SizeConfig.textSizeMainHeading * 1.2,
                      color: Colors.grey,
                    ),
                  ),
                );
              } else {
                return const PagesListItem();
              }
            },
          ),
        ),
      ),
    );
  }
}

class PagesListItem extends StatelessWidget {
  const PagesListItem({Key? key}) : super(key: key);

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
          leading: const Icon(Icons.article),
          title: const Text('Page name'),
          subtitle: const Text(
              'Page description will be placed here and will contain a short summary about the group.'),
        ),
      ),
    );
  }
}
