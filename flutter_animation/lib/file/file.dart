import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class filePage extends StatefulWidget {
  const filePage({super.key});

  @override
  State<filePage> createState() => _filePageState();
}

class _filePageState extends State<filePage> {
  counterStorage storage = counterStorage();
  int filecount = 0;
  @override
  void initState() {
    // TODO: implement initState
    readCounter();
    super.initState();
  }

  void incrementCounter() {
    filecount += 1;
    storage.writeFile(filecount);
    readCounter();
  }

  Future<void> readCounter() async {
    filecount = await storage.readFile();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  incrementCounter();
                },
                child: const Text("increment")),
            Text("file coount $filecount")
          ],
        ),
      ),
    );
  }
}

class counterStorage {
  Future<String> getLocalePath() async {
    final path = await getApplicationDocumentsDirectory();
    return path.path;
  }

  Future<File> get localeFile async {
    final path = await getLocalePath();
    return File("$path/counter.txt");
  }

  Future<int> readFile() async {
    try {
      final file = await localeFile;
      String count = await file.readAsString();
      return int.parse(count);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeFile(int counter) async {
    final file = await localeFile;
    return file.writeAsString('$counter');
  }
}
