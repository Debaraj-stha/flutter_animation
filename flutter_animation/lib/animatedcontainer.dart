import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({Key? key}) : super(key: key);

  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  TextEditingController textEditingController = TextEditingController();
  List<bool> animatedStates = [
    false,
    false,
    false,
    false
  ]; // Track animation state for each container
  List<double> opacityValues = [0, 0, 0, 0]; // Track opacity for each digit

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void animateContainer(int index) {
    if (!animatedStates[index]) {
      _controller.forward().then((_) {
        setState(() {
          opacityValues[index] =
              1.0; // Set opacity to 1 when animation moves forward
          animatedStates[index] = true;
        });
        _controller.reverse().then((_) {
          setState(() {
            opacityValues[index] =
                0.0; // Set opacity to 0 when animation reverses
            animatedStates[index] = false;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container on User Input'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: animatedStates[index] ? 80 : 50,
                  height: animatedStates[index] ? 80 : 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: animatedStates[index] ? Colors.blue : Colors.red,
                  ),
                  child: Center(
                    child: Opacity(
                      opacity: opacityValues[index],
                      child: Text(
                        textEditingController.text.length > index
                            ? textEditingController.text[index]
                            : "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: animatedStates[index] ? 20 : 16,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: textEditingController,
              onChanged: (value) {
                if (value.length <= 4) {
                  // Reset animatedStates and opacityValues if input length is less than or equal to 4
                  setState(() {
                    animatedStates = [false, false, false, false];
                    opacityValues = [0, 0, 0, 0];
                  });
                  animateContainer(value.length - 1);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
