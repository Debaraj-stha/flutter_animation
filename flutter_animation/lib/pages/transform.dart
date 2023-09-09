import 'package:flutter/material.dart';
import 'dart:math';

class transformAnimation extends StatefulWidget {
  const transformAnimation({Key? key}) : super(key: key);

  @override
  State<transformAnimation> createState() => _TransformAnimationState();
}

class _TransformAnimationState extends State<transformAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller, controller;
  late Animation<double> _animation, animation;
  bool isBig = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    _controller.repeat(reverse: true); // Rotates back and forth

    setState(() {
      controller.repeat(reverse: true);
      controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void handle() {
    setState(() {
      isBig = !isBig;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _animation.value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(
                      minHeight: 50,
                      minWidth: 60,
                      maxWidth: 70,
                      maxHeight: 80,
                    ),
                  ),
                );
              },
            ),
            TextButton(
              child: Text("chnge container"),
              onPressed: () {
                handle();
              },
            ),
            AnimatedScale(
                scale: animation.value,
                duration: Duration(seconds: 2),
                child: isBig
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints:
                            BoxConstraints(minHeight: 100, minWidth: 100),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints:
                            BoxConstraints(minHeight: 150, minWidth: 170),
                      )),
            Container(
              constraints: BoxConstraints(
                maxHeight: 200,
                maxWidth: 200,
              ),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(blurRadius: 5, offset: Offset(5, 5), spreadRadius: 1),
                BoxShadow(
                    blurRadius: 10, offset: Offset(-5, -5), spreadRadius: 1)
              ], color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: 30,
            ),
            // TweenAnimationBuilder(
            //     tween: Tween<Offset>(begin: Offset(0, -4),end: Offset(0, 0)),
            //     child: Text("Animated Text"),
            //     duration: Duration(milliseconds: 500),
            //     builder: (context,value, child) {
            //       return Padding(
            //         padding: EdgeInsets.only(top: value.dy+10),
            //         child: child,
            //       );
            //     }),
            TweenAnimationBuilder<Offset>(
              tween: Tween<Offset>(begin: Offset(0, -4), end: Offset(0, 4)),
              duration: Duration(milliseconds: 500),
              builder: (context, offset, child) {
                return Transform.translate(
                  offset: offset,
                  child: child,
                );
              },
              child: Text(
                "Animated Text",
                style: TextStyle(fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
