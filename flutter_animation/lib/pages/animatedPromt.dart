import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 35, 35),
      appBar: AppBar(),
      body: const Center(
        child: animatedPrompt(
            title: "Thankyou for your feedback",
            subtitle: "We will definitely think on your feedback.",
            child: Icon(
              Icons.check,
              color: Colors.white,
            )),
      ),
    );
  }
}

// class animatedPrompt extends StatefulWidget {
//   const animatedPrompt(
//       {super.key,
//       required this.title,
//       required this.subtitle,
//       required this.child});
//   final String title;
//   final String subtitle;
//   final Widget child;
//   @override
//   State<animatedPrompt> createState() => _animatedPromptState();
// }

// class _animatedPromptState extends State<animatedPrompt>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<double> _iconAnimation;
//   late Animation<double> containerAnimation;
//   late Animation<Offset> containsAnimation;
//   @override
//   void initState() {
//     // TODO: implement initState
//     controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//     containsAnimation = Tween<Offset>(
//             begin: const Offset(0, 0), end: const Offset(0, -0.23))
//         .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
//     _iconAnimation = Tween<double>(begin: 7, end: 6)
//         .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
//     containerAnimation = Tween<double>(begin: 2.0, end: 0.4)
//         .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     controller
//       ..reset()
//       ..forward();
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: Container(
//         // constraints: BoxConstraints(
//         //   minHeight:
//         // ),
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.black.withOpacity(0.2),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: const Offset(0, -3))
//             ]),
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//               minHeight: 100,
//               minWidth: 100,
//               maxHeight: MediaQuery.of(context).size.height * 0.8,
//               maxWidth: MediaQuery.of(context).size.width * 0.8),
//           child: Stack(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(32),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const SizedBox(
//                       height: 160,
//                     ),
//                     Text(
//                       widget.title,
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       widget.subtitle,
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black),
//                     )
//                   ],
//                 ),
//               ),
//               Positioned.fill(
//                   child: SlideTransition(
//                 position: containsAnimation,
//                 child: ScaleTransition(
//                   scale: containerAnimation,
//                   child: Container(
//                     decoration: const BoxDecoration(
//                         color: Colors.green, shape: BoxShape.circle),
//                     child: ScaleTransition(
//                       scale: _iconAnimation,
//                       child: widget.child,
//                     ),
//                   ),
//                 ),
//               ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class animatedPrompt extends StatefulWidget {
  const animatedPrompt(
      {super.key,
      required this.title,
      required this.child,
      required this.subtitle});
  final String title;
  final String subtitle;
  final Widget child;
  @override
  State<animatedPrompt> createState() => _animatedPromptState();
}

class _animatedPromptState extends State<animatedPrompt>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _yAnimation;
  late Animation<double> _iconAnimation, containerAnimation, sequenceAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _iconAnimation = Tween<double>(begin: 7, end: 6)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    containerAnimation =
        Tween<double>(begin: 2, end: 0.4).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    ));
    _yAnimation = Tween<Offset>(
            begin: const Offset(0, 0), end: const Offset(0, -0.23))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    sequenceAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 30), weight: 50)
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller
      ..reset()
      ..forward();
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(32),
        constraints: BoxConstraints(
            minHeight: 100,
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            minWidth: 100,
            maxWidth: MediaQuery.of(context).size.width * 0.8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.subtitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Positioned.fill(
                child: SlideTransition(
              position: _yAnimation,
              child: ScaleTransition(
                scale: containerAnimation,
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                  child: ScaleTransition(
                    scale: _iconAnimation,
                    child: widget.child,
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
