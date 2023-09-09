import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_animation/horizontalScrollAnimation.dart';

import '../model.dart';
import 'dart:math';

class AnimatedListView extends StatefulWidget {
  const AnimatedListView({super.key});

  @override
  State<AnimatedListView> createState() => _AnimatedListViewState();
}

class _AnimatedListViewState extends State<AnimatedListView>
    with TickerProviderStateMixin {
  AnimationController? controller;
  late Animation<double> rotate;
  @override
  void initState() {
    // TODO: implement initState
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addUser();
    });
    Tween<Offset> offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));
    rotate = Tween<double>(begin: 0, end: 2 * pi).animate(controller!);
    controller?.reset();
    controller?.forward();
    controller?.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }

  final key = GlobalKey<AnimatedListState>();
  List<Widget> listTiles = [];
  void addUser() {
    List<User> users = [
      User(name: "Manish"),
      User(name: "Manish"),
      User(name: "Manish"),
      User(name: "Manish"),
      User(name: "Manish"),
      User(name: "Manish"),
      User(name: "Manish"),
      User(name: "Manish"),
      User(name: "Manish"),
      User(name: "Manish"),
      User(name: "Manish"),
      User(name: "Manish"),
    ];
    Future f = Future(() {});
    users.forEach((User u) {
      f = f.then((value) {
        return Future.delayed(Duration(milliseconds: 100), () {
          listTiles.add(buildTile(u));
          key.currentState!.insertItem(listTiles.length - 1);
        });
      });
    });
  }

  Widget buildTile(User user) {
    return ListTile(
      title: Text(user.name),
    );
  }

  Tween<Offset> offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedBuilder(
                  animation: rotate,
                  child: Container(
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                  ),
                  builder: (context, child) {
                    return Transform.rotate(
                      alignment: Alignment.center,
                      angle: rotate.value,
                      child: child,
                    );
                  }),
              Container(
                child: AnimatedList(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    key: key,
                    initialItemCount: listTiles.length,
                    itemBuilder: (context, index, animation) {
                      return SlideTransition(
                        position: animation.drive(offset),
                        child: listTiles[index],
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
