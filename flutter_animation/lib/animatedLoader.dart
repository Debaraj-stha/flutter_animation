import 'package:flutter/material.dart';

class AnimatedLoader extends StatefulWidget {
  const AnimatedLoader({super.key});

  @override
  State<AnimatedLoader> createState() => _AnimatedLoaderState();
}

class _AnimatedLoaderState extends State<AnimatedLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // late Animation<double> rotate;
  late List<Animation> _rotateList;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _rotateList = List.generate(3, (index) {
      return Tween<double>(begin: 0.0, end: 4).animate(CurvedAnimation(
          parent: _controller, curve: Interval(index / 3, (index + 1) / 3)));
    });
    // rotate = Tween<double>(begin: 0.0, end: 1)
    //     .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.repeat(reverse: true);
    // _controller.addListener(() {
    //   setState(() {

    //   });
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<double> size = [30, 60, 90];
  List<Color> colors = [Colors.lightGreen, Colors.green, Colors.greenAccent];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loader"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Stack(alignment: Alignment.center, children: [
                AnimatedBuilder(
                    animation: _rotateList[0],
                    builder: (contex, child) {
                      return Transform.rotate(
                        angle: _rotateList[0].value,
                        child: Stack(alignment: Alignment.center, children: [
                          Container(
                            width: size[0],
                            height: size[0] - 10,
                            decoration: BoxDecoration(
                                // shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: const [
                                  BoxShadow(color: Colors.blue, spreadRadius: 5)
                                ]
                                // border: Border.all(
                                //   color: Colors.blue,
                                //   width: 1.5,
                                // )
                                ),
                          ),
                          Positioned(
                              right: 0,
                              bottom: 7,
                              child: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                width: 10,
                                height: 10,
                              )),
                          Positioned(
                              left: 0,
                              bottom: 7,
                              child: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                width: 10,
                                height: 10,
                              ))
                        ]),
                      );
                    }),
                AnimatedBuilder(
                    animation: _rotateList[1],
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _rotateList[1].value,
                        child: Stack(alignment: Alignment.center, children: [
                          Container(
                            width: size[1],
                            height: size[1] - 10,
                            decoration: BoxDecoration(
                                // shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 1.5,
                                )),
                          ),
                          Positioned(
                              right: 30,
                              top: 0,
                              child: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                width: 10,
                                height: 10,
                              )),
                          Positioned(
                              left: 30,
                              bottom: 0,
                              child: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                width: 10,
                                height: 10,
                              ))
                        ]),
                      );
                    }),
                AnimatedBuilder(
                    animation: _rotateList[2],
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _rotateList[2].value,
                        child: Stack(alignment: Alignment.center, children: [
                          Container(
                            width: size[2],
                            height: size[2] - 10,
                            decoration: BoxDecoration(
                                // shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 1.5,
                                )),
                          ),
                          Positioned(
                              right: 0,
                              bottom: 30,
                              child: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                width: 10,
                                height: 10,
                              )),
                          Positioned(
                              left: 0,
                              bottom: 30,
                              child: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                width: 10,
                                height: 10,
                              ))
                        ]),
                      );
                    }),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Loading...",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
