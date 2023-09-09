import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key, required this.image, required this.index});
  final String image;
  final int index;
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: widget.index,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(3, -3),
                    spreadRadius: 7,
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.2)),
              ],
            ),
            child: Image(image: AssetImage(widget.image), fit: BoxFit.cover)),
      ),
    );
  }
}
