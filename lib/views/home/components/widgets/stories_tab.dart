import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:social_network/models/story.dart';
import 'package:social_network/services/database_services.dart';
import 'package:social_network/utilities/route_transitions.dart';
import 'package:social_network/utilities/size_config.dart';
import 'package:social_network/views/common_widgets/image_loader.dart';

class StoriesTab extends StatelessWidget {
  const StoriesTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0,
            ),
            child: Text(
              'Stories',
              style: TextStyle(
                fontSize: SizeConfig.textSizeMainHeading * 1.2,
                color: Colors.grey,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.1),
            itemCount: stories.length,
            itemBuilder: (context, index) {
              final _alignment =
                  index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: _StoryWidget(
                  story: stories[index],
                  alignment: _alignment,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StoryWidget extends StatelessWidget {
  final Story story;
  final Alignment alignment;
  const _StoryWidget({
    required this.story,
    required this.alignment,
    Key? key,
  }) : super(key: key);

  Widget _userName() {
    final Widget _text = Text(
      story.author.name,
      style: TextStyle(
        color: Colors.grey.shade400,
      ),
    );
    late List<Widget> _children;
    late AlignmentGeometry _begin;
    late AlignmentGeometry _end;
    if (alignment == Alignment.centerLeft) {
      _children = [
        const SizedBox(
          width: 60,
        ),
        _text,
      ];
      _begin = const Alignment(-0.5, 0);
      _end = const Alignment(-1, 0);
    } else {
      _children = [
        _text,
        const SizedBox(
          width: 60,
        ),
      ];
      _begin = const Alignment(0.5, 0);
      _end = const Alignment(1, 0);
    }
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: _begin,
          end: _end,
          colors: const [Colors.grey, Colors.transparent],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: _children,
        ),
      ),
    );
  }

  Widget _userAvatar() {
    return ClipOval(
      child: SizedBox.fromSize(
        size: const Size.fromRadius(30),
        child: ImageLoader(
          imageUrl: story.author.imageUrl,
          placeHolderSize: const Size.fromRadius(30),
          placeholderWidget: Container(
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: UnconstrainedBox(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  ScaleTransitionRoute(
                    page: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Align(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                          child: Hero(
                            tag: story.id,
                            child: Image.network(
                              story.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Hero(
                tag: story.id,
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(SizeConfig.screenWidth * 0.3),
                    child: ImageLoader(
                      imageUrl: story.imageUrl,
                      placeHolderSize:
                          Size.fromRadius(SizeConfig.screenWidth * 0.3),
                      placeholderWidget: Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            alignment == Alignment.centerLeft
                ? Positioned(
                    bottom: 0,
                    left: 0,
                    child: _userName(),
                  )
                : Positioned(
                    bottom: 0,
                    right: 0,
                    child: _userName(),
                  ),
            alignment == Alignment.centerLeft
                ? Positioned(
                    bottom: 0,
                    left: 0,
                    child: _userAvatar(),
                  )
                : Positioned(
                    bottom: 0,
                    right: 0,
                    child: _userAvatar(),
                  ),
          ],
        ),
      ),
    );
  }
}
