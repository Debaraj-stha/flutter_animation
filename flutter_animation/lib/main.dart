import 'package:flutter/material.dart';
import 'package:flutter_animation/animatedLoader.dart';
import 'package:flutter_animation/animatedLoaders.dart';
import 'package:flutter_animation/animatedcontainer.dart';
import 'package:flutter_animation/animationwithbounceEffect.dart';
import 'package:flutter_animation/coloranimation.dart';
import 'package:flutter_animation/horizontalScrollAnimation.dart';
import 'package:flutter_animation/lottieanimation.dart';
import 'package:flutter_animation/notifylistener.dart';
import 'package:flutter_animation/pages/HeroAnimations.dart';
import 'package:flutter_animation/pages/animatedAuthScreen.dart';
import 'package:flutter_animation/pages/animatedListview.dart';
import 'package:flutter_animation/pages/animatedPageRoute.dart';
import 'package:flutter_animation/pages/animatedPromt.dart';
import 'package:flutter_animation/pages/scaleAnimation.dart';
import 'package:flutter_animation/pages/textAnimation.dart';
import 'package:flutter_animation/pages/transform.dart';
import 'package:flutter_animation/pages/tweenSequence.dart';
import 'package:flutter_animation/prompt.dart';
import 'package:flutter_animation/rippleAnimation.dart';
import 'package:flutter_animation/stackCard.dart';
import 'package:flutter_animation/translate.dart';
import 'package:flutter_animation/typingindicator.dart';

import 'clipper/clippedWidget.dart';
import 'clipper/clipper.dart';
import 'pages/animation.dart';
import 'pages/heroanimation.dart';

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
      home: Prompt(),
    );
  }
}
