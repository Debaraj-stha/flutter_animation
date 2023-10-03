import 'package:flutter/material.dart';

class ScrollAnimation extends StatefulWidget {
  const ScrollAnimation({super.key});

  @override
  State<ScrollAnimation> createState() => _ScrollAnimationState();
}

class _ScrollAnimationState extends State<ScrollAnimation> {
  final ScrollController _scrollController = ScrollController();
  List<String> data = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        if (data.length <= 105) {
          isLoading = true;
          Future.delayed(const Duration(seconds: 2), () {
            addData();
          });
          setState(() {});
        }
        print("at the bottom");
      }
    });
    addData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void addData() {
    int dataLength = data.length;

    for (var i = 0; i < 15; i++) {
      data.add("data item of index $i of length $dataLength");
    }

    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.indigo,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(8, 8),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        data[index],
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Visibility(
                visible: isLoading,
                child: const CircularProgressIndicator(),
              ),
              Visibility(
                visible: !isLoading,
                child: Container(
                  child: const Text(
                    "No more data to load",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
