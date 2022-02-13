import 'package:flutter/material.dart';

class VideosTab extends StatelessWidget {
  const VideosTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 400,
              color: Colors.blue,
              child: const Text('Videos'),
            ),
          ],
        ),
      ),
    );
  }
}
