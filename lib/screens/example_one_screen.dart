import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:provider_tutorial/provider/example_provider.dart";

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  double value = 1.0;
  @override
  Widget build(BuildContext context) {
    // final exampleOneProvider = Provider.of<ExampleOneProvider>(context);
    print("............build.............");
    return Scaffold(
      appBar: AppBar(
        title: const Text("example 1"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Slider(
                  min: 0,
                  max: 1,
                  value: value.value,
                  onChanged: (val) {
                    value.setValue(val);
                  });
            },
          ),
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.green.withOpacity(value.value),
                      child: const Text("container 1"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red.withOpacity(value.value),
                      child: const Text("container 2"),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
