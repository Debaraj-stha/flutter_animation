import 'package:flutter/material.dart';
import 'package:flutter_animation/secondPageOfAnimationWithBounce.dart';

class AnimationWithBounce extends StatefulWidget {
  const AnimationWithBounce({Key? key}) : super(key: key);

  @override
  State<AnimationWithBounce> createState() => _AnimationWithBounceState();
}

class _AnimationWithBounceState extends State<AnimationWithBounce>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late PageController _pageController;
  int _currentPage = 0;
  late Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _pageController = PageController(viewportFraction: 0.4, initialPage: 0);
    _offsetAnimation = Tween<Offset>(
            begin: const Offset(0, -4), end: const Offset(0, 4))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
    _controller.forward();
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.stop();
      }
    });
    setState(() {});
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<bool> animatedItems = List.filled(10, false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation with bounce effect"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 100),
          alignment: Alignment.topLeft,
          height: 600,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (va) {
              setState(() {
                _currentPage = _pageController.page!.round();
                _currentPage =
                    _currentPage != 9 ? _currentPage + 2 : _currentPage;
              });
            },
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              debugPrint("page$_currentPage");
              debugPrint("index$index");

              // Check if the item should be animated
              bool shouldAnimate =
                  index == _currentPage - 1 && !animatedItems[index];

              if (shouldAnimate) {
                // Mark the item as animated
                animatedItems[index] = true;

                // Start the animation
                _controller.reset();
                _controller.forward();
              }

              return AnimatedBuilder(
                animation: _offsetAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: shouldAnimate
                        ? _offsetAnimation.value
                        : const Offset(0, 0),
                    child: child,
                  );
                },
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 500),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return ScaleTransition(
                            scale: animation,
                            child: const contentOfAnimation(),
                          );
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 110,
                    height: 400,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("asset/image3.jpg"),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              width: 1.5,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Text(
                          "Ram Bahadur",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
