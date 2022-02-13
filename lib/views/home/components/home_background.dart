import 'package:flutter/material.dart';
import 'package:social_network/utilities/size_config.dart';

class HomeBackground extends StatelessWidget {
  final Widget mainBody;
  const HomeBackground({
    required this.mainBody,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
          ),
          mainBody,
        ],
      ),
    );
  }
}
