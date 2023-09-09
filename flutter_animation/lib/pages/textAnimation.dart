// import 'package:flutter/material.dart';

// class TextAnimation extends StatefulWidget {
//   const TextAnimation({Key? key}) : super(key: key);

//   @override
//   _TextAnimationState createState() => _TextAnimationState();
// }

// class _TextAnimationState extends State<TextAnimation>with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 500),
//     );

//     _animation = Tween<Offset>(
//       begin: Offset(0, -4),
//       end: Offset(0, 4),
//     ).animate(_controller);

//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         _controller.reverse(); // Reverse the animation at the end
//       } else if (status == AnimationStatus.dismissed) {
//         _controller.forward(); // Restart the animation
//       }
//     });

//     _controller.forward(); // Start the animation
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _animation,
//           builder: (context, child) {
//             return Transform.translate(
//               offset: _animation.value,
//               child: child,
//             );
//           },
//           child: Text(
//             "Animated Text",
//             style: TextStyle(fontSize: 24),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class TextAnimation extends StatefulWidget {
  const TextAnimation({Key? key}) : super(key: key);

  @override
  _TextAnimationState createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = Tween<Offset>(
      begin: Offset(0, -4),
      end: Offset(0, 4),
    ).animate(_controller);

    _controller.forward(); 
    _controller.reverse();// Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: _animation.value,
              child: child,
            );
          },
          child: Text(
            "Animated Text",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

