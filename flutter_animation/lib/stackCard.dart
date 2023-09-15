import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class CardStack extends StatelessWidget {
  CardStack({super.key});
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.indigo,
    Colors.purple,
    Colors.yellow
  ];
  Map<String, dynamic> text = {
    "title":
        "Incididunt laborum consectetur anim qui magna commodo est mollit id mollit ullamco culpa esse.",
    "description":
        "Arum deserunt irure. Consectetur et incididunt eiusmod cillum culpa non paccaecat."
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Card Stack"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            child: Swiper(
              axisDirection: AxisDirection.down,
              viewportFraction:
                  0.1, // Adjust this value to show more of the previous item
              itemHeight: 500,
              allowImplicitScrolling: true,
              fade: 0.8,
              loop: false,
              itemWidth: MediaQuery.of(context).size.width,
              itemCount: 7,
              duration: 300,
              transformer: ScaleAndFadeTransformer(scale: 0.5, fade: 0.8),
              layout: SwiperLayout.STACK,
              scrollDirection: Axis.vertical,
              itemBuilder: ((context, index) {
                return generateCard(index, colors[index]);
              }),
            ),
          ),
        ));
  }

  Widget generateCard(int index, Color color) {
    return Container(
      width: 350,
      height: 500,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text['title'],
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            text['description'],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
