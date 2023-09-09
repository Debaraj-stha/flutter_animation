import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class animationOnScroll extends StatefulWidget {
  const animationOnScroll({super.key});

  @override
  State<animationOnScroll> createState() => _animationOnScrollState();
}

class _animationOnScrollState extends State<animationOnScroll>
    with SingleTickerProviderStateMixin {
  late ScrollController scrollController;
  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController();
    scrollController.addListener(listenScroll);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.removeListener(listenScroll);
    scrollController.dispose();
    super.dispose();
  }

  void listenScroll() {
    debugPrint("scroll offset ${scrollController.offset}");
    setState(() {});
  }

  double cardHeight = 100.0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("animation on scroll")),
      body: Container(
        color: Colors.blueGrey,
        child: ListView.builder(
            itemCount: 15,
            controller: scrollController,
            itemBuilder: ((context, index) {
              final itemOffset = index * cardHeight;
              final diff = scrollController.offset - itemOffset;
              final percent = 1 - (diff / cardHeight);
              double opacity = percent;
              double scale = percent;
              debugPrint("percent" + percent.toString());
              if (percent > 1.0) {
                opacity = 1.0;
              }
              if (percent < 0.0) {
                opacity = 0.0;
              }
              if (percent > 1.0) {
                scale = 1.0;
              }
              return Align(
                heightFactor: 0.5,
                child: Opacity(
                    opacity: opacity,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..scale(scale, 1.0),
                      child: Container(
                        height: cardHeight,
                        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image(
                          image: NetworkImage(
                              "https://picsum.photos/seed/picsum/200/300"),
                        ),
                      ),
                    )),
              );
            })),
      ),
    );
  }
}
