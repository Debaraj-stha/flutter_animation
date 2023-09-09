import 'package:flutter/material.dart';

class tweenSequence extends StatefulWidget {
  const tweenSequence({Key? key}) : super(key: key);

  @override
  _tweenSequenceState createState() => _tweenSequenceState();
}

class _tweenSequenceState extends State<tweenSequence>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> colorAnimation;
  late Animation<double> tweenSequence;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    colorAnimation = ColorTween(
      begin: Colors.grey,
      end: Colors.red,
    ).animate(_controller);

    _controller.addListener(() {});

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isLiked = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          isLiked = false;
        });
      }
    });

    tweenSequence = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 30.0, end: 50.0),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: 50.0, end: 30.0),
          weight: 50.0,
        ),
      ],
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: colorAnimation,
            builder: (context, child) {
              return InkWell(
                child: Icon(
                  Icons.favorite,
                  color: colorAnimation.value ?? Colors.grey,
                  size: tweenSequence.value,
                ),
                onTap: () {
                  setState(() {
                    isLiked ? _controller.reverse() : _controller.forward();
                  });
                },
              );
            },
          )
        ],
      ),
    );
  }
}
