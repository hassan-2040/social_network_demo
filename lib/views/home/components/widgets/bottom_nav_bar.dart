import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:social_network/services/database_services.dart';
import 'package:social_network/utilities/route_transitions.dart';
import 'package:social_network/utilities/size_config.dart';
import 'package:social_network/views/common_widgets/image_loader.dart';

class BottomNavBar extends StatelessWidget {
  final TabController tabController;
  const BottomNavBar({
    required this.tabController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              child: Ink(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      SlideRightTransitionRoute(
                        page: Align(
                          alignment: Alignment.centerLeft,
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                            child: const DrawerColumn(),
                          ),
                        ),
                      ),
                    );
                  },
                  customBorder: const CircleBorder(),
                  child: const Center(
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.centerRight,
                    colors: [Colors.grey.shade900, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Theme(
                      data: ThemeData(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                      ),
                      child: TabBar(
                        controller: tabController,
                        isScrollable: true,
                        physics: const ClampingScrollPhysics(),
                        padding:
                            EdgeInsets.only(right: SizeConfig.screenWidth / 3),
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelColor: Colors.black,
                        labelPadding: const EdgeInsets.all(10),
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Text(
                            'Stories',
                            style: TextStyle(
                              fontSize: SizeConfig.textSizeLarge * 1.1,
                            ),
                          ),
                          Text(
                            'Posts',
                            style: TextStyle(
                              fontSize: SizeConfig.textSizeLarge * 1.1,
                            ),
                          ),
                          Text(
                            'Videos',
                            style: TextStyle(
                              fontSize: SizeConfig.textSizeLarge * 1.1,
                            ),
                          ),
                          Text(
                            'Groups',
                            style: TextStyle(
                              fontSize: SizeConfig.textSizeLarge * 1.1,
                            ),
                          ),
                          Text(
                            'Pages',
                            style: TextStyle(
                              fontSize: SizeConfig.textSizeLarge * 1.1,
                            ),
                          ),
                          Text(
                            'Notifications',
                            style: TextStyle(
                              fontSize: SizeConfig.textSizeLarge * 1.1,
                            ),
                          ),
                          Text(
                            'Friends',
                            style: TextStyle(
                              fontSize: SizeConfig.textSizeLarge * 1.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerColumn extends StatelessWidget {
  const DrawerColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 2, child: SizedBox()),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.12),
            child: ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(SizeConfig.screenWidth * 0.2),
                child: ImageLoader(
                  imageUrl: currentUser.imageUrl,
                  placeHolderSize:
                      Size.fromRadius(SizeConfig.screenWidth * 0.2),
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
          const Expanded(flex: 1, child: SizedBox()),
          const DrawerButton(buttonText: 'View Your Profile'),
          const Expanded(flex: 2 ,child: SizedBox()),
          const DrawerButton(buttonText: 'Help Center'),
          const SizedBox(
            height: 10,
          ),
          const DrawerButton(buttonText: 'Account Settings'),
          const SizedBox(
            height: 10,
          ),
          const DrawerButton(buttonText: 'App Settings'),
          const SizedBox(
            height: 10,
          ),
          const DrawerButton(buttonText: 'Terms & Privacy Policy'),
          const SizedBox(
            height: 10,
          ),
          const DrawerButton(buttonText: 'Sign Out'),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  final String buttonText;
  const DrawerButton({
    required this.buttonText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        width: SizeConfig.screenWidth * 0.6,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: Colors.grey.shade900,
            primary: Colors.grey,
            padding: const EdgeInsets.all(10),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
