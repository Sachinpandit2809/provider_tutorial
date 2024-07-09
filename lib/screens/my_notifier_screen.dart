import 'dart:ffi';

import 'package:flutter/material.dart';

class MyNotifierScreen extends StatelessWidget {
  MyNotifierScreen({super.key});
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text("data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: _toggle,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: _toggle.value,
                  decoration: InputDecoration(
                      hintText: "password",
                      suffix: InkWell(
                        onTap: () {
                          _toggle.value = !_toggle.value;
                          print(_toggle.value);
                        },
                        // child: _toggle.value
                        //     ? Icon(Icons.visibility)
                        //     : Icon(Icons.visibility_off),
                        child: Icon(_toggle.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                );
              },
            ),
            Center(
                child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  "count " + value.toString(),
                  style: Theme.of(context).textTheme.headlineLarge,
                );
              },
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
