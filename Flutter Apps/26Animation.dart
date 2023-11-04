import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAnimationDemo(),
    );
  }
}

class MyAnimationDemo extends StatefulWidget {
  @override
  _MyAnimationDemoState createState() => _MyAnimationDemoState();
}

class _MyAnimationDemoState extends State<MyAnimationDemo> {
  bool _isAnimated = false;

  void _toggleAnimation() {
    setState(() {
      _isAnimated = !_isAnimated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 1),
              width: _isAnimated ? 200 : 100,
              height: _isAnimated ? 100 : 200,
              color: _isAnimated ? Colors.blue : Colors.red,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleAnimation,
              child: Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}
