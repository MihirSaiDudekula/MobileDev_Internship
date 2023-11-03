import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black, // Set background color to black
        primaryColor: Colors.yellow, // Set text color to yellow
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Theme Example'),
      ),
      body: Center(
        child: Text(
          'Welcome to Flutter Themes',
          style: TextStyle(
            fontSize: 24,
            color: Colors.yellow, // Set text color explicitly
          ),
        ),
      ),
    );
  }
}
