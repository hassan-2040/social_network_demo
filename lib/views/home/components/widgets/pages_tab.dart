import 'package:flutter/material.dart';

class PagesTab extends StatelessWidget {
  const PagesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: List<PagesListItem>.generate(
            50,
            (_) => const PagesListItem(),
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
