import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:flutter_animation/customRoute.dart';
import 'package:flutter_animation/horizontalScrollAnimation.dart';
import 'package:lottie/lottie.dart';

class lottieAnimation extends StatefulWidget {
  const lottieAnimation({super.key});

  @override
  State<lottieAnimation> createState() => _lottieAnimationState();
}

class _lottieAnimationState extends State<lottieAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isGreen = false;
  bool isTextReady = false;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.addListener(() {
      if (_controller.value > 0.7) {
        _controller.stop();
        setState(() {
          isGreen = true;
        });
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            isTextReady = true;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          const Text("ajajja"),
         
          AnimatedContainer(
            height: isGreen ? (height / 1.45) : height,
            duration: const Duration(seconds: 1),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(isGreen ? 15 : 0),
                    bottomLeft: Radius.circular(isGreen ? 15 : 0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedCrossFade(
                    firstChild:
                        Lottie.asset("asset/lottie/animation_lmbodmoh.json"),
                    secondChild: Lottie.asset(
                        "asset/lottie/animation_lmboeocz.json",
                        height: height / 2,
                        controller: _controller, onLoaded: (composition) {
                      _controller.duration = composition.duration;
                      _controller.forward();
                    }),
                    crossFadeState: isGreen
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(seconds: 2)),
                Center(
                    child: AnimatedOpacity(
                  opacity: isTextReady ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, customRoute(child: animation3()));
                    },
                    child: const Text(
                      "Coffiee",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ))

              ],
            ),
          ),
           Visibility(
            visible: isGreen,
            child: Container(
              height: 400,
              
              child: const Text("Visible content",style: TextStyle(color: Colors.white),)),
          ),
        ],
      ),
    );
  }
}
