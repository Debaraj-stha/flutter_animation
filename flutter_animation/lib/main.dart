import 'package:flutter/material.dart';
import 'package:flutter_animation/animatedOpacityLoader.dart';
import 'package:flutter_animation/clipper/clippers.dart';
import 'package:flutter_animation/custompaints/custompaints.dart';
import 'package:flutter_animation/pages/scrollAnimation.dart';

import 'file/file.dart';



void main() async {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: ScrollAnimation(),
    );
  }
}
