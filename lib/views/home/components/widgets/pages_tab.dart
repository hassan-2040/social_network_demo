import 'package:flutter/material.dart';

class PagesTab extends StatelessWidget {
  const PagesTab({Key? key}) : super(key: key);

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
              child: const Text('Pages'),
            ),
          ],
        ),
      ),
    );
  }
}
