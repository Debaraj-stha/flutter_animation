import 'package:flutter/material.dart';
import 'dart:math' as math;


class CircularLoader extends StatefulWidget {
  const CircularLoader({super.key});

  @override
  _CircularLoaderState createState() => _CircularLoaderState();
}

class _CircularLoaderState extends State<CircularLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 360)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildContainer(double angle, double radius) {
    return Transform.translate(
      offset: Offset(
        radius * math.cos(angle),
        radius * math.sin(angle),
      ),
      child: Container(
        width: 20,
        height: 20,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double radius = 50.0;
    final List<Widget> containers = [];

    for (var i = 0; i < 6; i++) {
      final double angle = 2 * math.pi * i / 6;
      containers.add(_buildContainer(angle, radius));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Circular Loader'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.rotate(
              angle: _animation.value,
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: containers,
              ),
            );
          },
        ),
      ),
    );
  }
}
