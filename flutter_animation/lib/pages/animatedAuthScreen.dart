import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AnimatedAuthScreen extends StatefulWidget {
  const AnimatedAuthScreen({super.key});

  @override
  State<AnimatedAuthScreen> createState() => _AnimatedAuthScreenState();
}

class _AnimatedAuthScreenState extends State<AnimatedAuthScreen>
    with TickerProviderStateMixin {
  Animation<double>? textAnimatio;
  late AnimationController controller;
  bool isLogin = true;
  @override
  void initState() {
    // TODO: implement initState
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    textAnimatio = Tween<double>(begin: 0, end: 90).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                width: size.width * 0.88,
                height: size.height,
                left: isLogin ? -size.width * 0.76 : 0,
                child: GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   isLogin = !isLogin;
                    // });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Text("Login form"),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                width: size.width,
                height: size.height,
                left: isLogin ? size.width * 0.12 : size.width * 0.88,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    child: Text("signup form"),
                  ),
                ),
              ),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  bottom: isLogin ? size.height / 2 - 80 : size.height * 0.3,
                  left: isLogin ? 0 : size.width * 0.44 - 80,
                  child: AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 500),
                      style: TextStyle(fontSize: isLogin ? 20 : 30),
                      child: InkWell(
                        onTap: () {
                          if (isLogin) {
                            debugPrint("tapped");

                            setState(() {
                              isLogin = !isLogin;
                            });
                            isLogin
                                ? controller.forward()
                                : controller.reverse();
                          }
                        },
                        child: Transform.rotate(
                            alignment: Alignment.topLeft,
                            angle: -textAnimatio!.value * pi / 180,
                            child: Container(
                                width: 160,
                                color: Colors.green,
                                padding: EdgeInsets.all(16),
                                child: Text("Login"))),
                      ))),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  bottom: !isLogin ? size.height / 2 - 80 : size.height * 0.3,
                  right: isLogin ? size.width * 0.44 - 80 : 0,
                  child: AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 500),
                      style: TextStyle(fontSize: isLogin ? 20 : 30),
                      child: InkWell(
                        onTap: () {
                          if (isLogin) {
                          } else {
                            debugPrint("tapped");

                            setState(() {
                              isLogin = !isLogin;
                            });
                            isLogin
                                ? controller.forward()
                                : controller.reverse();
                          }
                        },
                        child: Transform.rotate(
                            alignment: Alignment.topRight,
                            angle: (90 - textAnimatio!.value) * pi / 180,
                            child: Container(
                                width: 160,
                                color: Colors.green,
                                padding: EdgeInsets.all(16),
                                child: Text("signup"))),
                      )))
            ]);
          }),
    );
  }
}
