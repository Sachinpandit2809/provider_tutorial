import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  int x = 100;
  @override
  Widget build(BuildContext context) {
    print(".............build.............");
    return Scaffold(
      appBar: AppBar(
        title: Text("provider Totorial"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(x.toString(), style: TextStyle(fontSize: 30)))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
      
            x++;
            print(x);
            
          },
          child: Icon(Icons.add)),
    );
  }
}
