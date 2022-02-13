import 'package:flutter/material.dart';

class PostsTab extends StatelessWidget {
  const PostsTab({Key? key}) : super(key: key);

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
              child: const Text('Posts'),
            ),
          ],
        ),
      ),
    );
  }
}
