import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class notifylistener extends StatefulWidget {
  const notifylistener({super.key});

  @override
  State<notifylistener> createState() => _notifylistenerState();
}

class _notifylistenerState extends State<notifylistener> {
  ValueNotifier<String> message = ValueNotifier("sss");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: ValueListenableBuilder(
              valueListenable: message,
              builder: ((context, value, child) {
                return Text(value,style: TextStyle(color: Colors.red),);
              }))),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if(notification is ScrollUpdateNotification){
         message.value="scrolling update";
          return true;
          }
          if (notification is ScrollStartNotification){
            message.value="scroll end";
              return true;
          }
          else{
            return true;
          }
        },
          child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("option ${index}"),
                  );
                }),
          ],
        ),
      )),
    );
  }
}
