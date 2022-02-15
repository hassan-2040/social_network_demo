import 'dart:async';

import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  final String imageUrl;
  final Size? placeHolderSize;
  final Widget placeholderWidget;
  const ImageLoader({
    required this.imageUrl,
    required this.placeHolderSize,
    required this.placeholderWidget,
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
        // return Center(
        //   child: CircularProgressIndicator(
        //     valueColor: AlwaysStoppedAnimation<Color>(loadingColor),
        //     strokeWidth: width,
        //     value: loadingProgress.expectedTotalBytes != null
        //         ? loadingProgress.cumulativeBytesLoaded /
        //             loadingProgress.expectedTotalBytes!
        //         : null,
        //   ),
        // );
        return _LoadingWidget(
          size: placeHolderSize,
          placeholderWidget: placeholderWidget,
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

class _LoadingWidget extends StatefulWidget {
  final Size? size;
  final Widget placeholderWidget;
  const _LoadingWidget({
    required this.size,
    required this.placeholderWidget,
    Key? key,
  }) : super(key: key);

  @override
  __LoadingWidgetState createState() => __LoadingWidgetState();
}

class __LoadingWidgetState extends State<_LoadingWidget> {
  bool _visible = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 500), (Timer t) {
      _callSetState();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _callSetState() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 0.5 : 0.1,
      duration: const Duration(milliseconds: 500),
      child: SizedBox.fromSize(
        size: widget.size,
        child: widget.placeholderWidget,
      ),
    );
  }
}
