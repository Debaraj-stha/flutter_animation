import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';

class AnimationBuild extends StatefulWidget {
  const AnimationBuild({super.key});

  @override
  State<AnimationBuild> createState() => _AnimationBuildState();
}

class _AnimationBuildState extends State<AnimationBuild>
    with TickerProviderStateMixin {
  // late AnimationController _controller;
  // late AnimationController controller;
  // late AnimationController slideAnimationController;
  // late Animation<Offset> slideAnimation;
  late Animation<double> animation,delayedAnimation;
  late AnimationController controller1;
  int count = 0;
  bool isShown = false;
  bool isFirst = false;
  void increaseCount() {
    setState(() {
      count++;
      isShown = !isShown;
      isFirst = !isFirst;
      // controller.reset();
      // controller.forward();
    });
  }

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(vsync: this);

    // slideAnimationController =
    //     AnimationController(vsync: this, duration: Duration(seconds: 4));
    // slideAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0))
    //     .animate(slideAnimationController);
    // controller =
    //     AnimationController(vsync: this, duration: Duration(seconds: 2));
    // slideAnimationController
    //   ..repeat()
    //   ..forward();
    
    controller1 = AnimationController(vsync: this, duration: Duration(seconds: 2));
    
    animation = Tween<double>(begin: -1, end: 0)
        .animate(CurvedAnimation(parent: controller1, curve: Curves.bounceIn));

    delayedAnimation = Tween<double>(begin: -1, end: 0).animate(CurvedAnimation(
        parent: controller1,
        curve: Interval(0.5, 1, curve: Curves.bounceInOut)));

    controller1.forward();
  }

  @override
  void dispose() {
    // _controller.dispose();
    // controller.dispose();
    // slideAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Transform(
              transform: Matrix4.translationValues(animation.value * MediaQuery.of(context).size.width, 0, 0),
              alignment: Alignment.center,
              child: Text("Transform Animated text"),
            ),
            Transform(
              transform: Matrix4.translationValues(delayedAnimation.value * MediaQuery.of(context).size.width, 0, 0),
              alignment: Alignment.center,
              child: Text("Delayed Animation Animated text"),
            ),
          // AnimatedBuilder(
          //     animation: slideAnimationController,
          //     builder: (context, child) {
          //       return Transform.translate(
          //         offset: Offset(slideAnimation.value.dx * 6, 0),
          //         child: Text("slide test"),
          //       );
          //     }),
          // Text("animated switcher"),
          // TextButton(
          //     onPressed: () {
          //       increaseCount();
          //     },
          //     child: Text("Increase")),
          // AnimatedSwitcher(
          //   duration: Duration(seconds: 1),
          //   child: Text(
          //     count.toString(),
          //     key: ValueKey(count),
          //   ),
          //   transitionBuilder: (Widget child, Animation<double> animation) {
          //     return ScaleTransition(
          //       scale: animation,
          //       child: child,
          //     );
          //   },
          // ),
          // AnimatedSwitcher(
          //   duration: Duration(microseconds: 300),
          //   child: isShown
          //       ? SizeTransition(
          //           sizeFactor: CurvedAnimation(
          //             parent: controller,
          //             curve: Curves.easeInOut,
          //           ),
          //           axis: Axis.horizontal,
          //           child: Container(
          //             key: ValueKey<bool>(isShown),
          //             width: 200,
          //             height: 200,
          //             color: Colors.blue,
          //           ),
          //         )
          //       : SizeTransition(
          //           sizeFactor: CurvedAnimation(
          //             parent: controller,
          //             curve: Curves.easeInOut,
          //           ).drive(Tween<double>(
          //             begin: 1.0,
          //             end: 0.0,
          //           )),
          //           axis: Axis.horizontal,
          //           child: Container(
          //             key: ValueKey<bool>(isShown),
          //             width: 200,
          //             height: 100,
          //             color: Colors.red,
          //           ),
          //         ),
          // ),
          // AnimatedSwitcher(
          //   duration: Duration(microseconds: 1000),
          //   child: isFirst
          //       ? Text(
          //           "First text",
          //           key: ValueKey(isFirst),
          //         )
          //       : Text(
          //           "Second text",
          //           key: ValueKey(isFirst),
          //         ),
          //   transitionBuilder: (Widget child, Animation<double> animation) {
          //     return ScaleTransition(
          //       scale: animation,
          //       child: child,
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}
