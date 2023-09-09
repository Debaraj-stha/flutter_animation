import 'package:flutter/material.dart';
import 'secondPage.dart'; // Import the secondPage widget from the correct file

class HeroAnimation extends StatefulWidget {
  const HeroAnimation({
    super.key,
  });

  @override
  State<HeroAnimation> createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  List<String> image = [
    "asset/image1.jpg",
    "asset/image2.jpg",
    "asset/image3.jpg",
    "asset/image4.jpg",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: image.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>SecondPage(image: image[index], index: index)));
            },
            child: Hero(
              tag: index, // Unique tag for each image
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(3, -3),
                      spreadRadius: 7,
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(image[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
