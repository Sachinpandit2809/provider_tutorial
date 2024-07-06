import 'package:flutter/material.dart';

class StatefulwidgetScreen extends StatefulWidget {
  const StatefulwidgetScreen({super.key});

  @override
  State<StatefulwidgetScreen> createState() => _StatefulwidgetScreenState();
}

class _StatefulwidgetScreenState extends State<StatefulwidgetScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    print("..............build..............");
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
          print(count);
          setState(() {
            
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
