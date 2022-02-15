import 'package:flutter/material.dart';

class ScaleTransitionRoute extends PageRouteBuilder {
  final Widget page;
  ScaleTransitionRoute({required this.page})
      : super(
        opaque: false,
          barrierDismissible: true,
          pageBuilder: (
            BuildContext context,
            _,
            __,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}

class SlideRightTransitionRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightTransitionRoute({required this.page})
      : super(
          opaque: false,
          barrierDismissible: true,
          pageBuilder: (
            BuildContext context,
            _,
            __,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
