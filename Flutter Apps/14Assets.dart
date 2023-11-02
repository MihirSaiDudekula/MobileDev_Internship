/*
while adding the image,edit the pubspec.yaml
  # To add assets to your application, add an assets section, like this:
  assets:
  - assets/images/Moon.jpg
  - assets/images/tree.jpg
*/
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Images Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/Moon.jpg', // Replace with the path to your first image asset
              width: 200.0,
              height: 200.0,
            ),
            Image.asset(
              'assets/images/tree.jpg', // Replace with the path to your second image asset
              width: 200.0,
              height: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
