import 'package:flutter/material.dart';

class Prompt extends StatelessWidget {
  const Prompt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: buildPrompt(
          title: "Thank for your Feedback",
          subtitle: "We will think on it definitely",
          child: Icon(Icons.check, color: Colors.white),
        ),
      ),
    );
  }
}

class buildPrompt extends StatefulWidget {
  const buildPrompt(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.child});
  final String title;
  final String subtitle;
  final Widget child;
  @override
  State<buildPrompt> createState() => _buildPromptState();
}

class _buildPromptState extends State<buildPrompt>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> containerAnimation, iconAnimatio;
  late Animation<Offset> yAnimation;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    yAnimation = Tween<Offset>(
            begin: const Offset(0, 0), end: const Offset(0, -0.23))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    containerAnimation = Tween<double>(begin: 2, end: 0.4)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
    iconAnimatio = Tween<double>(begin: 7, end: 6)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    animation = TweenSequence(<TweenSequenceItem<double>>[
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
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(32),
          constraints: BoxConstraints(
            minHeight: 100,
            minWidth: 100,
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Text(widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(widget.subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))
                ],
              ),
              Positioned.fill(
                  child: SlideTransition(
                position: yAnimation,
                child: ScaleTransition(
                  scale: containerAnimation,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                    child: ScaleTransition(
                      scale: iconAnimatio,
                      child: widget.child,
                    ),
                  ),
                ),
              )),
              AnimatedBuilder(
                  animation: animation,
                  builder: ((context, child) => Icon(
                        Icons.favorite,
                        size: animation.value,
                        color: Colors.red,
                      )))
            ],
          ),
        ));
  }
}
