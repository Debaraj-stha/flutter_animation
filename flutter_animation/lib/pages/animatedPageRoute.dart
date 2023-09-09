import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_animation/pages/secondRoutePage.dart';

class animatedPageRoute extends StatefulWidget {
  const animatedPageRoute({super.key});

  @override
  State<animatedPageRoute> createState() => _animatedPageRouteState();
}

class _animatedPageRouteState extends State<animatedPageRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Page 1"),
        ),
        body: Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 500),
                          reverseTransitionDuration:
                              Duration(milliseconds: 500),
                          pageBuilder:
                              ((context, animation, secondaryAnimation) {
                            return FadeTransition(
                              opacity: animation,
                              child: secondRoutePage(),
                            );
                          })));
                },
                child: Text("Push"))
          ],
        ));
  }
}
