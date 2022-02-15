import 'package:flutter/material.dart';
import 'package:social_network/utilities/enums.dart';
import 'package:social_network/utilities/size_config.dart';
import 'package:social_network/views/home/components/widgets/bottom_nav_bar.dart';
import 'package:social_network/views/home/components/widgets/friends_tab.dart';
import 'package:social_network/views/home/components/widgets/groups_tab.dart';
import 'package:social_network/views/home/components/widgets/notifications_tab.dart';
import 'package:social_network/views/home/components/widgets/pages_tab.dart';
import 'package:social_network/views/home/components/widgets/posts_tab.dart';
import 'package:social_network/views/home/components/widgets/stories_tab.dart';
import 'package:social_network/views/home/components/widgets/videos_tab.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 7,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 100,
            right: SizeConfig.screenWidth / 4,
            child: const _RotatingWidgetColum(
              firstColor: Colors.green,
              secondColor: Colors.blue,
              thirdColor: Colors.red,
              durationRef: 5,
              radiusRef: 10,
              rotationDirection: RotationDirection.clockwise,
            ),
          ),
          Positioned(
            top: SizeConfig.screenHeight / 2,
            left: SizeConfig.screenWidth / 6,
            child: const _RotatingWidgetColum(
              firstColor: Colors.orange,
              secondColor: Colors.purple,
              thirdColor: Colors.cyan,
              durationRef: 5,
              radiusRef: 10,
              rotationDirection: RotationDirection.anticlockwise,
            ),
          ),
          Positioned(
            bottom: 100,
            right: SizeConfig.screenWidth / 4,
            child: const _RotatingWidgetColum(
              firstColor: Colors.teal,
              secondColor: Colors.amber,
              thirdColor: Colors.deepPurpleAccent,
              durationRef: 5,
              radiusRef: 10,
              rotationDirection: RotationDirection.clockwise,
            ),
          ),
          TabBarView(
            controller: _tabController,
            children: const [
              StoriesTab(),
              PostsTab(),
              VideosTab(),
              GroupsTab(),
              PagesTab(),
              NotificationsTab(),
              FriendsTab(),
            ],
          ),
          Positioned(
            bottom: 0,
            child: BottomNavBar(tabController: _tabController),
          ),
        ],
      ),
    );
  }
}

class _RotatingWidgetColum extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;
  final Color thirdColor;
  final int durationRef;
  final double radiusRef;
  final RotationDirection rotationDirection;
  const _RotatingWidgetColum({
    required this.firstColor,
    required this.secondColor,
    required this.thirdColor,
    required this.durationRef,
    required this.radiusRef,
    required this.rotationDirection,
    Key? key,
  }) : super(key: key);

  Widget _rotationChild(Color _color) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _widgetColor(_color),
      ),
    );
  }

  Color _widgetColor(Color _c) {
    return _c.withOpacity(0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularRotationAnimation(
          duration: durationRef,
          radius: radiusRef,
          rotatingChild: _rotationChild(firstColor),
          rotationDirection: rotationDirection,
        ),
        CircularRotationAnimation(
          duration: durationRef + 2,
          radius: radiusRef + 10,
          rotatingChild: _rotationChild(secondColor),
          rotationDirection: rotationDirection,
        ),
        CircularRotationAnimation(
          duration: durationRef + 4,
          radius: radiusRef + 20,
          rotatingChild: _rotationChild(thirdColor),
          rotationDirection: rotationDirection,
        ),
      ],
    );
  }
}

class CircularRotationAnimation extends StatefulWidget {
  final Widget rotatingChild;
  final int duration;
  final double radius;
  final RotationDirection rotationDirection;
  const CircularRotationAnimation({
    required this.rotatingChild,
    required this.radius,
    required this.duration,
    required this.rotationDirection,
    Key? key,
  }) : super(key: key);

  @override
  _CircularRotationAnimationState createState() =>
      _CircularRotationAnimationState();
}

class _CircularRotationAnimationState extends State<CircularRotationAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationValue;

  @override
  void initState() {
    _rotationController = AnimationController(
      duration: Duration(seconds: widget.duration),
      vsync: this,
    )..repeat();

    if (widget.rotationDirection == RotationDirection.clockwise) {
      _rotationValue = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _rotationController,
          curve: Curves.easeInOut,
        ),
      );
    } else {
      _rotationValue = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
          parent: _rotationController,
          curve: Curves.easeInOut,
        ),
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    _rotationController
      ..stop()
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotationValue,
      alignment: Alignment(widget.radius, 0),
      child: widget.rotatingChild,
    );
  }
}
