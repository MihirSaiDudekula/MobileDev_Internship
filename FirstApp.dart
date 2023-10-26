import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
              title: const Text('Rich text example'),
        ),
      ),
      body:Center(
        child:RichText(
          text: TextSpan(
            text: 'Hello',
            style: DefaultTextStyle.of(context).style,
            children: const<TextSpan>[
              TextSpan(
                text: 'bold',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)
              ),
              TextSpan(
                text: 'world',
                style: TextStyle(fontWeight: FontWeight.italic, color: Colors.green)
              ),
              TextSpan(
                text: 'this is a',
                style: TextStyle(color: Colors.black)
              ),
              TextSpan(
                text: 'different color',
                style: TextStyle(color: Colors.red)
              ),
            ] ),)
      )
  }
}
