import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySnackBarDemo(),
    );
  }
}

class MySnackBarDemo extends StatelessWidget {
  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('This is a SnackBar'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBar Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showSnackBar(context),
          child: Text('Show SnackBar'),
        ),
      ),
    );
  }
}
