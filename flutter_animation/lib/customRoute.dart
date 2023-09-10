import 'package:flutter/material.dart';

class customRoute extends PageRouteBuilder {
  final Widget child;
  customRoute({required this.child})
      : super(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) => child);
  @override
  Widget buildTransition(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }
}
