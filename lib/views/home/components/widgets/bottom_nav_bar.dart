import 'package:flutter/material.dart';
import 'package:social_network/utilities/size_config.dart';

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
                  onTap: () {},
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
