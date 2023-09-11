import 'package:flutter/material.dart';

class clipper extends StatelessWidget {
  const clipper({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ClipPath(
          clipper: customRectangle(),
          child: Container(
            height: 300,
            width: 600,
            color: Colors.red,
          ),
        ),
        ClipPath(
          clipper: traingleClip(),
          child: Container(
            height: 300,
            width: 600,
            color: Colors.red,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ClipPath(
          clipper: traingleClipupward(),
          child: Container(
            height: 300,
            width: 600,
            color: Colors.red,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ClipPath(
          clipper: diamond(),
          child: Container(
            height: 300,
            width: 600,
            color: Colors.red,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ClipPath(
          clipper: heart(),
          child: Container(
            height: 300,
            width: 600,
            color: Colors.red,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ClipPath(
          clipper: wave1(),
          child: Container(
            height: 300,
            width: 600,
            color: Colors.red,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            ClipPath(
              clipper: wave2(),
              child: Container(
                height: 300,
                width:MediaQuery.of(context).size.width,
                color: Colors.red,
              ),
            ),
            ClipPath(
              clipper: wave2(),
              child: Container(
                height: 200,
                width:MediaQuery.of(context).size.width,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class traingleClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    path.moveTo(width / 2, 10);
    path.lineTo(0, height);
    path.lineTo(width, height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class customRectangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double topWidth = size.width * 0.8;
    path.moveTo((size.width - topWidth) / 2, 0);
    path.lineTo((size.width + topWidth) / 2, 0);
    // path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class traingleClipupward extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    path.lineTo(width, 0);
    path.lineTo(width / 2, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class diamond extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    path.moveTo(width / 2, 0); // Move to the top-center point
    path.lineTo(0, height / 2); // Draw a line to the bottom-left point
    path.lineTo(width / 2, height); // Draw a line to the bottom-center point
    path.lineTo(width, height / 2); // Draw a line to the bottom-right point

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class heart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2875750, size.height * 0.1475571);
    path_0.quadraticBezierTo(size.width * 0.1685750, size.height * 0.1021571,
        size.width * 0.2354750, size.height * 0.4481143);
    path_0.lineTo(size.width * 0.4417083, size.height * 0.9756571);
    path_0.lineTo(size.width * 0.6744417, size.height * 0.3946857);
    path_0.quadraticBezierTo(size.width * 0.7080333, size.height * 0.1729000,
        size.width * 0.6447250, size.height * 0.1491429);
    path_0.quadraticBezierTo(size.width * 0.6059000, size.height * 0.1437143,
        size.width * 0.5600167, size.height * 0.1839143);
    path_0.lineTo(size.width * 0.4509083, size.height * 0.3280714);
    path_0.quadraticBezierTo(size.width * 0.3125083, size.height * 0.1358429,
        size.width * 0.2875750, size.height * 0.1475571);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class wave1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1700000, size.height * 0.1442857);
    path_0.lineTo(size.width * 0.1683333, size.height * 0.5728571);
    path_0.quadraticBezierTo(size.width * 0.3995917, size.height * 0.4325857,
        size.width * 0.5201583, size.height * 0.4417857);
    path_0.quadraticBezierTo(size.width * 0.6702083, size.height * 0.4494143,
        size.width * 0.8333333, size.height * 0.5728571);
    path_0.lineTo(size.width * 0.8341667, size.height * 0.1414286);
    path_0.lineTo(size.width * 0.1700000, size.height * 0.1442857);
    path_0.close();
    return path_0;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class wave2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1291667, size.height * 0.1485714);
    path_0.lineTo(size.width * 0.1275000, size.height * 0.5714286);
    path_0.quadraticBezierTo(size.width * 0.3866250, size.height * 0.4751429,
        size.width * 0.5375583, size.height * 0.3661857);
    path_0.quadraticBezierTo(size.width * 0.6898250, size.height * 0.3120286,
        size.width * 0.7909667, size.height * 0.4000143);
    path_0.lineTo(size.width * 0.8684667, size.height * 0.4814571);
    path_0.lineTo(size.width * 0.8691667, size.height * 0.1414286);
    path_0.lineTo(size.width * 0.1291667, size.height * 0.1485714);
    path_0.close();
    return path_0;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
