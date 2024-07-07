import 'dart:async';

import 'package:flutter/material.dart';

class StatefulwidgetScreen extends StatefulWidget {
  const StatefulwidgetScreen({super.key});

  @override
  State<StatefulwidgetScreen> createState() => _StatefulwidgetScreenState();
}

class _StatefulwidgetScreenState extends State<StatefulwidgetScreen> {
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(count);
    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      //setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print("..............build..............");
    print(count);
    return Scaffold(
      appBar: AppBar(
        title: Text("StatefulWidgetScreen"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(DateTime.now().toString()),
          Center(child: Text(count.toString(), style: TextStyle(fontSize: 30)))
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     count++;
      //     print(count);

      //     setState(() {});
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
