import 'package:flutter/material.dart';

class rippleAnimation extends StatefulWidget {
  const rippleAnimation({super.key});

  @override
  State<rippleAnimation> createState() => _rippleAnimationState();
}

class _rippleAnimationState extends State<rippleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 4), lowerBound: 0.5);
    animation = Tween<double>(begin: 0, end: 1).animate(
      _controller,
    );
    _controller.repeat();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<double> size = [150, 200, 250, 300, 350];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ripple effect"),
      ),
      body: Center(
        child: Stack(
            alignment: Alignment.center,
            children: size.map((e) {
              return buildContainer(e);
            }).toList()),
      ),
    );
  }

  Widget buildContainer(double size) {
    return Container(
      height: size * animation.value,
      width: size * animation.value,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.withOpacity(1 - animation.value)),
    );
  }
}
