/*
Icon in Flutter is a widget that displays a graphical symbol. It is used to represent a specific icon in your UI. Flutter provides a wide range of built-in icons through the Icons class.

In the provided code, the app displays three different icons along with their names:

The first icon is a star (Icons.star).
The second icon is a heart (Icons.favorite).
The third icon is a flower (Icons.local_florist).
Each icon is displayed using the Icon widget, and their size and color are customized using the size and color properties.

Here's a brief explanation of the properties used in the Icon widget:

Icons.star, Icons.favorite, and Icons.local_florist: These are the built-in icons available in Flutter. You can explore more icons in the official Flutter documentation.

size: This property determines the size of the icon. In the example, the size is set to 100.0.

color: This property sets the color of the icon. In the example, different colors (yellow, red, and green) are used for different icons.

Text: This widget is used to display text alongside the icons to indicate what each icon represents.

SizedBox: This widget is used to add some vertical spacing between the icons and the accompanying text.
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
        title: Text("Flutter Icons Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.star,
              size: 100.0,
              color: Colors.yellow,
            ),
            Text("Star Icon", style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 20.0),
            Icon(
              Icons.favorite,
              size: 100.0,
              color: Colors.red,
            ),
            Text("Favorite Icon", style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 20.0),
            Icon(
              Icons.local_florist,
              size: 100.0,
              color: Colors.green,
            ),
            Text("Florist Icon", style: TextStyle(fontSize: 20.0)),
          ],
        ),
      ),
    );
  }
}
