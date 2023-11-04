import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyProgressBarDemo(),
    );
  }
}

class MyProgressBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Bar Demo'),
      ),
      body: Center(
        child: LinearProgressIndicator(
          value: 0.5, // You can adjust the value (0.0 to 1.0) to show progress
        ),
      ),
    );
  }
}
