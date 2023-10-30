import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Text Positions in Flutter'),
          backgroundColor: Colors.grey,
        ),
        body: const Stack(
          children: <Widget>[
            // Text at top left corner
            Positioned(
              top: 20,
              left: 20,
              child: Text(
                'Top Left Corner',
                style: TextStyle(fontSize: 24),
              ),
            ),
            // Text at center of the screen
            Center(
              child: Text(
                'Centered Text',
                style: TextStyle(fontSize: 24),
              ),
            ),
            // Text at bottom right corner
            Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                'Bottom Right Corner',
                style: TextStyle(fontSize: 24),
              ),
            ),
            // Text at specific coordinates
            Positioned(
              top: 200,
              left: 100,
              child: Text(
                'Specific Position (100, 200)',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
