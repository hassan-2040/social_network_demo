import 'package:flutter/material.dart';
import 'package:social_network/models/user.dart';
import 'package:social_network/services/database_services.dart';
import 'package:social_network/utilities/size_config.dart';
import 'package:social_network/views/common_widgets/image_loader.dart';

class StoriesTab extends StatelessWidget {
  const StoriesTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            itemCount: users.length,
            itemBuilder: (context, index) {
              final _alignment =
                  index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: _StoryWidget(
                  user: users[index],
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
  final User user;
  final Alignment alignment;
  const _StoryWidget({
    required this.user,
    required this.alignment,
    Key? key,
  }) : super(key: key);

  Widget _userName() {
    final Widget _text = Text(
      user.name,
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
          imageUrl: user.imageUrl,
          width: 2,
          loadingColor: Colors.grey.shade600,
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
            Container(
              height: SizeConfig.screenWidth * 0.6,
              width: SizeConfig.screenWidth * 0.6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 241, 111, 102),
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
