import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCheckBoxDemo(),
    );
  }
}

class MyCheckBoxDemo extends StatefulWidget {
  @override
  _MyCheckBoxDemoState createState() => _MyCheckBoxDemoState();
}

class _MyCheckBoxDemoState extends State<MyCheckBoxDemo> {
  bool isChecked = false;

  void toggleCheckBox(bool? value) {
    if (value != null) {
      setState(() {
        isChecked = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Check the box:'),
            Checkbox(
              value: isChecked,
              onChanged: toggleCheckBox,
            ),
            Text('Checkbox is checked: $isChecked'),
          ],
        ),
      ),
    );
  }
}
