import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySwitchDemo(),
    );
  }
}

class MySwitchDemo extends StatefulWidget {
  @override
  _MySwitchDemoState createState() => _MySwitchDemoState();
}

class _MySwitchDemoState extends State<MySwitchDemo> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch Demo'),
      ),
      body: Center(
        child: Switch(
          value: _isSwitched,
          onChanged: (value) {
            setState(() {
              _isSwitched = value;
            });
          },
        ),
      ),
    );
  }
}
