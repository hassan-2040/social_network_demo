import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  final String imageUrl;
  final Color loadingColor;
  final double width;
  const ImageLoader({
    required this.imageUrl,
    this.loadingColor = Colors.blue,
    this.width = 4.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      frameBuilder: (
        BuildContext context,
        Widget image,
        int? frame,
        bool wasSynchronouslyLoaded,
      ) {
        if (wasSynchronouslyLoaded) return image;
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: frame == null ? 0 : 1,
          child: image,
        );
      },
      loadingBuilder: (
        BuildContext context,
        Widget image,
        ImageChunkEvent? loadingProgress,
      ) {
        if (loadingProgress == null ||
            (loadingProgress.expectedTotalBytes != null &&
                loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes! ==
                    1)) {
          return image;
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(loadingColor),
            strokeWidth: width,
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Text(
          'Could not load image',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 8,
          ),
        );
      },
    );
  }
}
