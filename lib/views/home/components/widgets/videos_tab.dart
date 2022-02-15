import 'package:flutter/material.dart';
import 'package:social_network/utilities/size_config.dart';
import 'package:social_network/views/common_widgets/image_loader.dart';

class VideosTab extends StatelessWidget {
  const VideosTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: List<VideosListItem>.generate(
            50,
            (_) => const VideosListItem(),
          ),
        ),
      ),
    );
  }
}

class VideosListItem extends StatelessWidget {
  const VideosListItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(25),
                    child: ImageLoader(
                      imageUrl:
                          'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                      width: 2,
                      loadingColor: Colors.grey.shade600,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Page/User Name',
                        style: TextStyle(
                          fontSize: SizeConfig.textSizeNormal,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.01),
                      Text(
                        '21 May 2020',
                        style: TextStyle(
                          fontSize: SizeConfig.textSizeSmall,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.more_horiz_outlined,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          const Text('Video caption will come here.'),
          Container(
            height: SizeConfig.screenHeight * 0.6,
            width: double.infinity,
            color: Colors.grey.shade900,
            child: Icon(
              Icons.play_circle_outline,
              size: 60,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
