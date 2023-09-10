import 'package:flutter/material.dart';

class clippedWidget extends StatelessWidget {
  const clippedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ClipPath(
                clipper: myClipper(),
                child: Container(
                  width: 900,
                  height: 600,
                  color: Colors.red,
                  child: const Text("Curved"),
                ),
              ),
              ClipPath(
                clipper: traingleClipper(),
                child: Container(
                  width: 900,
                  height: 600,
                  color: Colors.red,
                  child: const Text("Traingle"),
                ),
              ),
              ClipPath(
                clipper: traingleClipperdownward(),
                child: Container(
                  width: 900,
                  height: 600,
                  color: Colors.red,
                  child: const Text("Traingle 2"),
                ),
              ),
              ClipPath(
                clipper: rectangleClipped(),
                child: Container(
                  width: 900,
                  height: 300,
                  color: Colors.red,
                  child: const Text("custom rectangle"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ClipPath(
                clipper: rectangleClipped2(),
                child: Container(
                  width: 900,
                  height: 300,
                  color: Colors.red,
                  child: const Text("custom rectangle"),
                ),
              ),
              ClipPath(
                clipper: circleClip(),
                child: Container(
                  width: 900,
                  height: 300,
                  color: Colors.red,
                  child: const Text("circle"),
                ),
              ),
              ClipPath(
                clipper: container(),
                child: Container(
                  width: 900,
                  height: 300,
                  color: Colors.red,
                  child: const Text("container"),
                ),
              ),
              ClipPath(
                clipper: trainglecontainer(),
                child: Container(
                  width: 900,
                  height: 300,
                  color: Colors.red,
                  child: const Text("traingle container"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class myClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.lineTo(0, size.height);
    path_0.quadraticBezierTo(
        size.width * 0.5, size.height - 100, size.width, size.height);
    // path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, 0);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class traingleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
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

class traingleClipperdownward extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, 0); // Move to the top-middle point
    path.lineTo(
        size.width, size.height); // Draw a line to the bottom-right corner
    path.lineTo(0, size.height); // Draw a line to the bottom-left corner
    path.close(); // Close the path to form a triangle
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class rectangleClipped extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double topWidth = size.width * 0.8; // Adjust the top width as needed

    path.moveTo((size.width - topWidth) / 2, 0); // Move to the top-left corner
    path.lineTo((size.width + topWidth) / 2, 0); // Move to the top-right corner
    path.lineTo(
        size.width, size.height); // Draw a line to the bottom-right corner
    path.lineTo(0, size.height); // Draw a line to the bottom-left corner
    path.close(); // Close the path to form a rectangle
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class rectangleClipped2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double topWidth = size.width * 0.8; // Adjust the top width as needed

    path.moveTo((size.width - topWidth) / 2, 0);
    path.lineTo((size.width + topWidth) / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class circleClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // Create a circle path using the center of the widget as the center of the circle
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.height / 2));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class container extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // Create a circle path using the center of the widget as the center of the circle
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class trainglecontainer extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // Create a circle path using the center of the widget as the center of the circle
    path.moveTo(size.width/2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
