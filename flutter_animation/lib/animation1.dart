import 'package:flutter/material.dart';

class animations1 extends StatefulWidget {
  const animations1({Key? key}) : super(key: key);

  @override
  _animations1State createState() => _animations1State();
}

class _animations1State extends State<animations1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    animation = Tween(begin:-1.8, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: Column(
        children: [
          Text("sss"),
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                  animation.value * MediaQuery.of(context).size.width,
                  0.0,
                ),
                child: Container(
                  color: Colors.red,
                  child: Text(
                    "Transformed Container",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

