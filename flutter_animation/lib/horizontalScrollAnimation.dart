import 'package:flutter/material.dart';

class animation3 extends StatefulWidget {
  const animation3({Key? key}) : super(key: key);

  @override
  State<animation3> createState() => _animation3State();
}

class _animation3State extends State<animation3>
    with SingleTickerProviderStateMixin {
  late ScrollController controller;
  double initialScale = 0.5;
  double maxScale = 1;
  Duration scaleDuration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    double scale =
        (1 - (controller.offset / 200)).clamp(initialScale, maxScale);

    if (mounted) {
      setState(() {
        _currentScale = scale;
        _currentRadius = (controller.offset / 200).clamp(0.1,1.0) * 200.0;
        debugPrint("current radius" + _currentRadius.toString());
      });
    }
  }

  double _currentScale = 1.0;
  double _currentRadius = 0.0;
  String imageUrl =
      "https://images.unsplash.com/photo-1692317023059-499bf304ef55?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Row(
        children: [
          Container(
            width: _currentScale * 100, // Apply scaling to width
            height: _currentScale * 100, // Apply scaling to height
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(_currentRadius),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person, size: 40),
                );
              },
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}


