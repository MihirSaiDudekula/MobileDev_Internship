import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySliderDemo(),
    );
  }
}

class MySliderDemo extends StatefulWidget {
  @override
  _MySliderDemoState createState() => _MySliderDemoState();
}

class _MySliderDemoState extends State<MySliderDemo> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Demo'),
      ),
      body: Center(
        child: Slider(
          value: _sliderValue,
          onChanged: (value) {
            setState(() {
              _sliderValue = value;
            });
          },
        ),
      ),
    );
  }
}
