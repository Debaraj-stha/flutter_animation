import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DemoCustomPaints extends StatefulWidget {
  const DemoCustomPaints({super.key});

  @override
  State<DemoCustomPaints> createState() => _DemoCustomPaintsState();
}

class _DemoCustomPaintsState extends State<DemoCustomPaints> {
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        debugPrint(DateTime.now().minute.toString());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(DateTime.now().minute.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom paints"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const SizedBox(
              //   height: 110,
              // ),
              // CustomPaint(
              //   painter: CirclePainter(),
              //   child: const Text("Custom Paint"),
              // ),
              // const SizedBox(
              //   height: 100,
              // ),
              // Container(
              //     margin: const EdgeInsets.only(top: 80),
              //     color: Colors.white,
              //     width: 300,
              //     height: 200,
              //     child: CustomPaint(
              //       foregroundPainter: LinePainetr(),
              //     )),
              // Container(
              //     margin: const EdgeInsets.only(top: 80),
              //     color: Colors.white,
              //     width: 300,
              //     height: 200,
              //     child: CustomPaint(
              //       painter: ReactanglePainter(),
              //     )),
              // Container(
              //     margin: const EdgeInsets.only(top: 80),
              //     width: 300,
              //     height: 200,
              //     child: CustomPaint(
              //       painter: CirclePaint(),
              //     )),
              // Container(
              //     margin: const EdgeInsets.only(top: 80),
              //     width: 300,
              //     height: 200,
              //     child: CustomPaint(
              //       painter: RoundedRectanglePainter(),
              //     )),
              // Container(
              //     margin: const EdgeInsets.only(top: 80),
              //     width: 300,
              //     height: 200,
              //     child: CustomPaint(
              //       painter: ArcPainter(),
              //     )),
              // Container(
              //     margin: const EdgeInsets.only(top: 80),
              //     width: 300,
              //     height: 200,
              //     child: CustomPaint(
              //       painter: TrainglePainter(),
              //     )),
              Container(
                  margin: const EdgeInsets.only(top: 80),
                  width: 300,
                  height: 300,
                  child: Transform.rotate(
                    angle: -pi / 2,
                    child: CustomPaint(
                      painter: ClockPaint(),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class LinePainetr extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paints = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
    canvas.drawLine(Offset(size.width * 0.1, size.height / 2),
        Offset(size.width * 0.9, size.height / 2), paints);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class ReactanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paints = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), paints);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = Offset(size.width / 2, size.height / 2);
    var paint = Paint()..color = Colors.red;
    canvas.drawArc(
      Rect.fromCenter(center: center, width: 250, height: 250),
      0.4,
      2 * 3.14 - 0.6,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CirclePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = Offset(size.width / 2, size.height / 2);
    var paint = Paint()..color = Colors.red;

    canvas.drawCircle(center, size.height / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RoundedRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paints = Paint();

    paints
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    Radius radius = const Radius.circular(30);
    final a = Offset(size.width * 0.1, 0);
    final b = Offset(size.width * 0.8, size.height);
    final rect = Rect.fromPoints(a, b);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), paints);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paints = Paint();
    paints
      ..color = Colors.red
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final arch = Path();
    arch.moveTo(size.width * 0.2, size.height * 0.2);
    arch.arcToPoint(Offset(size.width * 0.9, size.height * 0.2),
        radius: const Radius.circular(180));
    canvas.drawPath(arch, paints);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class TrainglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint();
    paint
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class ClockPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var fill = Paint();
    fill
      ..color = Colors.indigo
      ..style = PaintingStyle.fill;
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var radius = min(
      centerX,
      centerY,
    );
    var center = Offset(centerX, centerY);
    var outline = Paint();
    outline
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    var centerDot = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    var second = Paint()
      ..color = Colors.purple
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    var minute = Paint()
      ..shader = const RadialGradient(colors: [Colors.yellow, Colors.lime])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = Colors.orange
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    var hour = Paint()
      ..shader =
          const RadialGradient(colors: [Colors.red, Colors.black, Colors.green])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = Colors.black
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    DateTime dateTime = DateTime.now();
    var secY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    var secX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var minX = centerX + 80 * cos(dateTime.minute*6 *pi / 180);
    var minY = centerX + 80 * sin(dateTime.minute *6* pi / 180);
    var hourX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourY = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var outerCircle = radius;
    var innerCircle = radius - 14;
    var dashed = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircle * cos(i * pi / 180);
      var y1 = centerX + outerCircle * sin(i * pi / 180);
      var x2 = centerX + innerCircle * cos(i * pi / 180);
      var y2 = centerX + innerCircle * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashed);
    }
    canvas.drawCircle(center, radius - 40, fill);
    canvas.drawCircle(center, radius - 40, outline);
    canvas.drawCircle(center, 15, centerDot);
    canvas.drawLine(center, Offset(secX, secY), second);
    canvas.drawLine(center, Offset(minX, minY), minute);
    canvas.drawLine(center, Offset(hourX, hourY), hour);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
