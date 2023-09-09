import 'package:flutter/material.dart';

class s extends StatefulWidget {
  @override
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<s> with TickerProviderStateMixin {
  PageController _pageController = PageController(viewportFraction: 0.7);
  late Animation delayed, animation;
  int _currentPage = 0;
  late AnimationController _animationController;
  double initialScale = 0.3;
  double finalScale = 1;
  double itemScale = 1;
  ScrollController _scrollController = ScrollController();
  List<String> data = ["Page 1", "Page 2", "Page 3", "Page 4"];
  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    animation = Tween<double>(begin: -1, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.bounceIn),
    );

    delayed = Tween<double>(begin: -1, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 1, curve: Curves.linear),
      ),
    );

    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    _scrollController.addListener(() {
      itemScale = 1.0 + (_scrollController.offset / 100.0).clamp(0.0, 2.0);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaling PageView'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedScale(
            scale: itemScale,
            duration: Duration(seconds: 1),
            alignment: Alignment.bottomLeft,
            curve: Curves.ease,
            child: Icon(Icons.person),
          ),
          Expanded(
            child: ListView.builder(
                controller: _scrollController,
                itemCount: 18,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("list item $index"),
                  );
                }),
          ),
          Transform(
            transform: Matrix4.translationValues(
              animation.value * MediaQuery.of(context).size.width,
              0,
              0,
            ),
            child: Text("animation"),
          ),
          Transform(
            transform: Matrix4.translationValues(
              delayed.value * MediaQuery.of(context).size.width,
              0,
              0,
            ),
            child: Text("delayed animation"),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            height: 160,
            child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  currentPage = _pageController.page!.round();
                  setState(() {});
                },
                itemCount: 15,
                itemBuilder: (context, index) {
                  var scale = currentPage == index ? 1.0 : 0.8;
                  return AnimatedSwitcher(
                    duration: Duration(microseconds: 350),
                    key: ValueKey(index),
                    child: TweenAnimationBuilder(
                      duration: Duration(microseconds: 350),
                      tween: Tween(begin: scale, end: scale),
                      curve: Curves.ease,
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Positioned(child: Text("Page $index"))
                        ],
                      ),
                      builder: (context, value, child) {
                        return Transform.scale(
                          child: child,
                          scale: value,
                        );
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
