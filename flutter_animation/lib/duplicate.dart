import 'package:flutter/material.dart';

class animatedContainer extends StatefulWidget {
  const animatedContainer({super.key});

  @override
  State<animatedContainer> createState() => _animatedContainerState();
}

class _animatedContainerState extends State<animatedContainer>
    with TickerProviderStateMixin {
  late List<AnimationController> _animatedControllers;
  late AnimationController _controller;
  late Animation sizeAnimation, delayAnimation;
  late Animation<double> opacityAnimation;
  late Animation<Offset> translate;
  String pin = "1234";
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    debugPrint("working");
    _animatedControllers = List.generate(
        4,
        (index) => AnimationController(
            vsync: this, duration: const Duration(milliseconds: 500)));
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    sizeAnimation = Tween<double>(begin: 20, end: 40).animate(CurvedAnimation(
        parent: _animatedControllers[currentIndex], curve: Curves.easeInOut));
    delayAnimation = Tween<double>(begin: 20, end: 80).animate(CurvedAnimation(
      parent: _animatedControllers[currentIndex],
      curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
    ));
    opacityAnimation = Tween<double>(begin: 0, end: 1)
        .animate(_animatedControllers[currentIndex]);
    translate =
        Tween<Offset>(begin: const Offset(-50, 10), end: const Offset(0, 0))
            .animate(_animatedControllers[currentIndex]);

    _animatedControllers[currentIndex].addListener(() {
      if (_animatedControllers[currentIndex].status ==
          AnimationStatus.completed) {
        _animatedControllers[currentIndex - 1].reverse();
        setState(() {});
      }
    });
  }

  animate(int index) {
    debugPrint("inderx$index");
    debugPrint(currentIndex.toString());
    if (index == currentIndex) {
      _animatedControllers[currentIndex].forward();
      if (currentIndex < 4) {
        currentIndex += 1;
      } else {
        return false;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    // _animatedControllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (index) {
              return Container(
                height: delayAnimation.value,
                width: delayAnimation.value,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Opacity(
                    opacity: opacityAnimation.value,
                    child: Text(
                      pin[index],
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: opacityAnimation.value * 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            }),
          ),
          TextButton(
              onPressed: () {
                animate(0);
              },
              child: const Text("Animate")),
          // Transform.translate(
          //   offset: translate.value,
          //   child: const Text("translated text"),
          // )
        ],
      ),
    ));
  }
}
