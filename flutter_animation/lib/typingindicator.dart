import 'package:flutter/material.dart';

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({Key? key}) : super(key: key);

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Color?>> colorAnimations;
  late List<Animation<Offset>> offsetAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    colorAnimations = List.generate(4, (index) {
      return ColorTween(
              begin: const Color.fromARGB(255, 85, 78, 78),
              end: const Color.fromARGB(255, 68, 140, 199))
          .animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index / 4, (index + 1) / 4),
        ),
      );
    });
    offsetAnimations = List.generate(4, (index) {
      return Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 3))
          .animate(CurvedAnimation(
              parent: _controller,
              curve: Interval(index / 6, (index + 1) / 4,
                  curve: Curves.bounceInOut)));
    });

    _controller.repeat(reverse: true);
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
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return AnimatedBuilder(
                          animation: colorAnimations[index],
                          builder: (context, child) {
                            return Transform.translate(
                              offset: offsetAnimations[index].value,
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  color: colorAnimations[index].value,
                                  shape: BoxShape.circle,
                                ),
                                width: 10,
                                height: 10,
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ),
                  // const TriangleClippedContainer(),
                ],
              ),
            ],
          ),
          // const clippedWidget()
        ],
      ),
    );
  }
}


class TriangleClippedContainer extends StatelessWidget {
  const TriangleClippedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TriangleClipper(),
      child: Container(
        width: 30.0, // Adjust the width and height as needed
        height: 30.0,
        color: const Color.fromARGB(255, 150, 151,
            152), // Change the color to your desired background color
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class pathCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
