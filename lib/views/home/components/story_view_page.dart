import 'package:flutter/material.dart';
import 'package:social_network/models/story.dart';
import 'package:social_network/utilities/size_config.dart';
import 'package:social_network/views/common_widgets/image_loader.dart';

class StoryViewPage extends StatelessWidget {
  final Story story;
  const StoryViewPage({
    required this.story,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Hero(
            tag: story.id,
            child: ImageLoader(
              imageUrl: story.imageUrl,
              placeHolderSize: Size.fromHeight(SizeConfig.screenHeight),
              placeholderWidget: Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
