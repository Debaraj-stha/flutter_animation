import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class secondRoutePage extends StatefulWidget {
  const secondRoutePage({super.key});

  @override
  State<secondRoutePage> createState() => _secondRoutePageState();
}

class _secondRoutePageState extends State<secondRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page"),
      ),
      body:Column(
        children: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Pop"))
        ],
      )
    );
  }
}