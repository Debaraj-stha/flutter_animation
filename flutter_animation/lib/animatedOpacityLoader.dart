import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedOpacityLoader extends StatefulWidget {
  const AnimatedOpacityLoader({super.key});

  @override
  State<AnimatedOpacityLoader> createState() => _AnimatedOpacityLoaderState();
}

class _AnimatedOpacityLoaderState extends State<AnimatedOpacityLoader>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  List<bool> isAnimated = [false, false, false, false, false, false];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      6,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 200),
      ),
    );

    _animations = _controllers.map((controller) {
      return Tween<double>(
        begin: 0.4,
        end: 1.0,
      ).animate(controller);
    }).toList();

    // Start the animations sequentially.
    _startNextAnimation();
  }

  _startNextAnimation() {
    // Check if the current index is within bounds.
    if (currentIndex >= 0 && currentIndex < _controllers.length) {
      _controllers[currentIndex].forward().then((_) {
        // Reverse the animation after it's completed.
        _controllers[currentIndex].reverse().then((_) {
          // Move to the next container and start its animation.
          currentIndex++;
          if (currentIndex < _controllers.length) {
            _startNextAnimation();
          } else {
            // All containers have been animated, reset to zero.
            currentIndex = 0;
            _startNextAnimation();
          }
        });
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated opacity loader"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: List.generate(6, (index) {
            double radius = 50;
            double angle = 2 * math.pi * index / 6;
            return AnimatedBuilder(
              animation: _animations[index],
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    radius * math.cos(angle),
                    radius * math.sin(angle),
                  ),
                  child: AnimatedOpacity(
                    opacity: _animations[index].value,
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(_animations[index].value),
                        shape: BoxShape.circle,
                      ),
                      height: 20,
                      width: 20,
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
