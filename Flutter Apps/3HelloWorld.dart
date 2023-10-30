import 'package:flutter/material.dart';

void main() {
  runApp(first_app());
}

class first_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material App
    return MaterialApp(

        // Scaffold Widget
        home: Scaffold(
      appBar: AppBar(
        // AppBar takes a Text Widget
        // in it's title parameter
        title: const Text('John'),
        backgroundColor: Colors.pink,
      ),
      body: const Center(
          child: Text(
        'Hello World',
        style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 40.0,
            fontWeight: FontWeight.bold),
      )),
      backgroundColor: Colors.yellowAccent,
    ));
  }
}
