import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void logClicked(String buttonType) {
    print("$buttonType Button Clicked");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Button Types Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  logClicked("Text");
                },
                child: Text('Text Button'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  logClicked("Elevated");
                },
                child: Text('Elevated Button'),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  logClicked("Outlined");
                },
                child: Text('Outlined Button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
