import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTooltipDemo(),
    );
  }
}

class MyTooltipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tooltip Demo'),
      ),
      body: Center(
        child: Tooltip(
          message: 'This is a tooltip example',
          child: Text('Hover over me'),
        ),
      ),
    );
  }
}
