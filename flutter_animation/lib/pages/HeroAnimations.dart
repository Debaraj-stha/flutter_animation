import 'package:flutter/material.dart';

class heroAnimation extends StatefulWidget {
  const heroAnimation({super.key});

  @override
  State<heroAnimation> createState() => _heroAnimationState();
}

class _heroAnimationState extends State<heroAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> users = [
    {"name": "jhon doe", "address": "America", "image": "asset/image1.jpg"},
    {"name": "Daniel doe", "address": "Uk", "image": "asset/image2.jpg"},
    {"name": "sunny doe", "address": "Canada", "image": "asset/image3.jpg"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contex) => secondPage(user: users[index])));
                },
                title: Hero(
                  tag: users[index]['name'],
                  child: Text(
                    users[index]['name'],
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Text(
                  users[index]['address'],
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(users[index]['image']),
                  radius: 30,
                ),
              );
            }));
  }
}

class secondPage extends StatefulWidget {
  const secondPage({super.key, this.user});
  final user;
  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
          tag: widget.user['name'],
          flightShuttleBuilder: (flightContext, animation, flightDirection,
              fromHeroContext, toHeroContext) {
            switch (flightDirection) {
              case HeroFlightDirection.push:
                return Material(
                    color: Colors.transparent,
                    child: ScaleTransition(
                        scale: animation.drive(Tween<double>(begin: 0, end: 1)
                            .chain(CurveTween(curve: Curves.fastOutSlowIn))),
                        child: toHeroContext.widget));
                break;
              case HeroFlightDirection.pop:
                return Material(
                    color: Colors.transparent, child: fromHeroContext.widget);
                break;
            }
          },
          child: CircleAvatar(
            backgroundImage: AssetImage(widget.user['image']),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              widget.user['name'],
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              widget.user['address'],
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
