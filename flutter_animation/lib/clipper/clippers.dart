import 'package:flutter/material.dart';

class Clippers extends StatelessWidget {
  const Clippers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ClipPath(
            clipper: ContainerClip(),
            child: Container(
              color: Colors.red,
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ClipPath(
            clipper: Rectangle(),
            child: Container(
              color: Colors.blue,
              width: 100,
              height: 100,
            ),
          ),
          ClipPath(
            clipper: TraingleClip(),
            child: Container(
              width: 200,
              height: 250,
              color: Colors.green,
            ),
          ),
          ClipPath(
            clipper: TraingleClipReverse(),
            child: Container(
              width: 200,
              height: 250,
              color: Colors.green,
            ),
          ),
          ClipPath(
            clipper: DimondClip(),
            child: Container(
              width: 200,
              height: 250,
              color: Colors.green,
            ),
          ),
          ClipPath(
            clipper: CircleClip(),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.green,
            ),
          ),
          ClipPath(
            clipper: HeartClip(),
            child: Container(
              width: 60,
              height: 300,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}

class ContainerClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    Path path = Path();
    double width = size.width;
    double height = size.height;
    path.lineTo(0, width);
    path.lineTo(width, height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class Rectangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    double x = size.width;
    double y = size.height;
    double topHeight = x * 0.8;
    path.moveTo((x - topHeight) / 2, 0);
    path.lineTo((x + topHeight) / 2, 0);
    path.lineTo(x, y);
    path.lineTo(0, y);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class TraingleClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    double x = size.width;
    double y = size.height;

    path.lineTo(x, 0);
    path.lineTo(x / 2, y);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class TraingleClipReverse extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    double x = size.width;
    double y = size.height;
    path.moveTo(x / 2, 0);
    path.lineTo(0, y);
    path.lineTo(x, y);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class DimondClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    double x = size.width;
    double y = size.height;
    path.moveTo(x / 2, 0);
    path.lineTo(0, y / 2);
    path.lineTo(x / 2, y);
    path.lineTo(x, y / 2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class CircleClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    double x = size.width;
    double y = size.height;
    path.addOval(Rect.fromCircle(center: Offset(x / 2, y / 2), radius: y / 2));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class HeartClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    double width = size.width;
    double height = size.height;
    Path path = Path();

    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);

    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
