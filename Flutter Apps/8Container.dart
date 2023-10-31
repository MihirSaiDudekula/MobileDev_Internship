import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container Example'),
        ),
        body: Center(
          child: Container(
            width: 500,
            height: 300,
            color: Colors.amber,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            constraints: BoxConstraints(
              maxHeight: 1000,
              minHeight: 100,
              maxWidth: 1000,
              minWidth: 100
            ),
            child: Text(
              "Hello! I am in the container widget",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
