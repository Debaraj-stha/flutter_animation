import 'package:flutter/material.dart';
import 'dart:math';

class translate extends StatefulWidget {
  const translate({Key? key}) : super(key: key);

  @override
  State<translate> createState() => _translateState();
}

class _translateState extends State<translate>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  late AnimationController c;
  late Animation animation, delayed;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    slideAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(-1, 0),
    ).animate(animationController);
    c = AnimationController(vsync: this, duration: Duration(seconds: 4));
    animation = Tween(begin: -1.0, end: 0.0)
        .animate(CurvedAnimation(parent: c, curve: Curves.bounceIn));
    delayed = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: c, curve: Interval(0.8, 1.0, curve: Curves.bounceIn)));
    animationController.addListener(() {
      animationController.forward();
      animationController.repeat();
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _startTranslation() {
    // animationController.reset();
    // animationController.forward();
  }

  String url =
      "https://images.unsplash.com/photo-1692317023059-499bf304ef55?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform Translate"),
      ),
      body: ListView(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(slideAnimation.value.dx * 6, 0),
                  child: CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person),
                  ),
                );
              },
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(
                delayed.value * MediaQuery.of(context).size.width, 0.0, 0.0),
            child: TextButton(
              onPressed: _startTranslation,
              child: Text(
                "Translate",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          // Center(
          //   child: Transform(
          //     alignment: Alignment.center,
          //     transform: Matrix4.rotationZ(pi * 1 / 4),
          //     child: Image(image: NetworkImage(url)),
          //   ),
          // ),
          Text("Color animated container"),
          TweenAnimationBuilder(
              tween: ColorTween(begin: Colors.red, end: Colors.green),
              duration: Duration(seconds: 4),
              builder: (context, value, child) {
                return Container(
                  height: 200,
                  width: 300,
                  color: value,
                );
              }),
          // AnimatedBuilder(
          //     animation: c.view,
          //     builder: (context, child) {
          //       return Transform.rotate(
          //         angle: c.value,
          //         child: child,
          //       );
          //     },child: CircleAvatar(radius: 40,child: Icon(Icons.person,color: Colors.white,),backgroundColor: Colors.indigo,),),
        ],
      ),
    );
  }
}
