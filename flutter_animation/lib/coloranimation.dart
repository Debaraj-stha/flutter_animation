import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';

class colorAnimation extends StatefulWidget {
  const colorAnimation({super.key});

  @override
  State<colorAnimation> createState() => _colorAnimationState();
}

class _colorAnimationState extends State<colorAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Color getRandomColor() {
    Random random = Random();
    int a = 255; // You can change the alpha (transparency) value as needed.
    int r = random.nextInt(256); // Red value (0-255)
    int g = random.nextInt(256); // Green value (0-255)
    int b = random.nextInt(256); // Blue value (0-255)
    return Color.fromARGB(a, r, g, b);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var color = getRandomColor();
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: ColorTween(begin: getRandomColor(), end: color),
          onEnd: () {
            color = getRandomColor();
            setState(() {});
          },
          duration: Duration(seconds: 1),
          child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          builder: (context, value, child) {
            return ColorFiltered(
              colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
              child: child,
            );
          },
        ),
      ),
    );
  }
}
