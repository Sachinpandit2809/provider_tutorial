import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/provider/count_provider.dart';

class CountProviderScreen extends StatefulWidget {
  const CountProviderScreen({super.key});

  @override
  State<CountProviderScreen> createState() => _CountProviderScreenState();
}

class _CountProviderScreenState extends State<CountProviderScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);

    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   countProvider.setCount();
    // });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print(",.....................build................");
    return Scaffold(
      appBar: AppBar(
        title: Text("CountProviderScreen"),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Consumer<CountProvider>(
            builder: (context, value, child) {
              print("....only text build....");
              return Text(value.count.toString(),
                  style: TextStyle(fontSize: 30));
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: countProvider.setCount,
        child: Icon(Icons.add),
      ),
    );
  }
}
