import 'package:flutter/material.dart';
import 'package:social_network/utilities/size_config.dart';

class StoriesTab extends StatelessWidget {
  const StoriesTab({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: const [
            _StoryWidget(alignment: Alignment.centerRight),
            _StoryWidget(alignment: Alignment.centerLeft),
            _StoryWidget(alignment: Alignment.centerRight),
            _StoryWidget(alignment: Alignment.centerLeft),
            _StoryWidget(alignment: Alignment.centerRight),
            _StoryWidget(alignment: Alignment.centerLeft),
            _StoryWidget(alignment: Alignment.centerRight),
            _StoryWidget(alignment: Alignment.centerLeft),
          ],
        ),
      ),
    );
  }
}

class _StoryWidget extends StatelessWidget {
  final Alignment alignment;
  const _StoryWidget({ required this.alignment,Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        height: SizeConfig.screenWidth * 0.6,
        width: SizeConfig.screenWidth * 0.6,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
