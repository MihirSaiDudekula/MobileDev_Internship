import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FloatingActionButton Example'),
        ),
        body: Center(
          child: Text('Press the button below!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Action to perform when the button is pressed
            print('Button Pressed!');
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}


