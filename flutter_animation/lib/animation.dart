import 'package:flutter/material.dart';

class animationPage extends StatefulWidget {
  const animationPage({Key? key}) : super(key: key);

  @override
  State<animationPage> createState() => _animationPageState();
}

class _animationPageState extends State<animationPage>
    with SingleTickerProviderStateMixin {
  late ScrollController controller;
  double initialScale = 0.5;
  double maxScale = 1;
  Duration scaleDuration = Duration(milliseconds: 500);
  // late AnimationController _controller;
  // late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_onScroll);
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: Duration(seconds: 2),
    // );

    // final double startSize = 100.0;
    // final double endSize = 200.0;

    // // Define a Tween<double> that transitions between startSize and endSize
    // final sizeTween = Tween<double>(begin: startSize, end: endSize);

    // // Create an Animation<double> that's controlled by the AnimationController
    // _animation = sizeTween.animate(_controller);

    // _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    // _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    double scale =
        (1 - (controller.offset / 200)).clamp(initialScale, maxScale);

    if (mounted) {
      setState(() {
        _currentScale = scale;

        // Calculate the radius value based on the scroll offset
        _currentRadius = (controller.offset).clamp(20, 300.0);
      });
      debugPrint(_currentRadius.toString());
    }
  }

  double _currentScale = 1.0;
  double _currentRadius = 20.0;
  bool isShow = true;
  String imageUrl =
      "https://images.unsplash.com/photo-1692317023059-499bf304ef55?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80";
  final listKey = GlobalKey<AnimatedListState>();
  List<String> item = [];
  void addItem() {
    item.insert(0, "animated_list ${item.length + 1}");
    listKey.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void deleteList(int index) {
    listKey.currentState?.removeItem(index, (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: Card(
          child: Text("deleted"),
        ),
      );
     
    },
    duration: Duration(seconds: 1)
    );
     item.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            _onScroll();
          }
          return false;
        },
        child: ListView(
          children: [
            AnimatedScale(
              duration: scaleDuration,
              scale: _currentScale,
              alignment: Alignment.topLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(_currentRadius),
                child: Image.network(imageUrl),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(title: Text("List item $index"));
              },
            ),
            // Text("Animated container"),
            // AnimatedContainer(
            //   height: isShow ? 300 : 200,
            //   width: isShow ? 400 : 300,
            //   duration: Duration(seconds: 1),
            //   child: Image(image: NetworkImage(imageUrl)),
            // ),
            
            // TextButton(
            //   onPressed: () {
            //     setState(() {
            //       isShow = !isShow;
            //     });
            //     debugPrint(isShow.toString());
            //   },
            //   child: Text("Toggle animated container"),
            // ),
            // TweenAnimationBuilder<double>(
            //   // Use the Animation<double> to build the widget
            //   tween: Tween(begin: _animation.value, end: _animation.value),
            //   duration: _controller.duration!,
            //   builder: (BuildContext context, double size, Widget? child) {
            //     return Container(
            //       width: size,
            //       height: size,
            //       color: Colors.blue,
            //       child: Center(
            //           child: Icon(
            //         Icons.person,
            //         size: size,
            //       )),
            //     );
            //   },
            // ),
            // Text("testing"),
            //   TextButton(onPressed: (){
            //   addItem();
            // }, child: Text("add list item",style: TextStyle(color: Colors.white),)),
            // Container(
            //   color: Colors.red,
            //   height: 300,
            //   child: AnimatedList(
            //     key: listKey,
            //     initialItemCount: 0,
            //     itemBuilder: (((context, index, animation) {
            //     return SizeTransition(sizeFactor: animation,child: Card(
            //       child:ListTile(
            //         title: Text(item[index]),
            //         trailing: TextButton(child: Text("delete"),onPressed: (){
            //           deleteList(index);
            //         },),
            //       ) ,
            //     ),);
            //   }))),
            // ),
          
          ],
        ),
      ),
    );
  }
}
