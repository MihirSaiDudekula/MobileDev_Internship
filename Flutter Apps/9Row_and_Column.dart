import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row and Column Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Row Example:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.green,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.blue,
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Column Example:'),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.orange,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.purple,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
