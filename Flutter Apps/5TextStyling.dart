import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Different Font Types Example'),
        ),
        body: const Center(
          // top: 20,
          // left:20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Text with TimesNew Roman',
                style: TextStyle(fontFamily: 'Times New Roman', fontSize: 24),
              ),
              SizedBox(height: 20,),
              Text(
                'Text with Calibri',
                style: TextStyle(fontFamily: 'Calibri', fontSize: 24),
              ),
              SizedBox(height: 20,),
              Text(
                'Text with Stencil',
                style: TextStyle(fontFamily: 'Stencil', fontSize: 24),
              ),
              SizedBox(height: 20,),
              Text(
                'Text with Algerian',
                style: TextStyle(fontFamily: 'Algerian', fontSize: 24),
              ),
              SizedBox(height: 20,),
              Text(
                'Text with Edwardian Script ITC',
                style: TextStyle(fontFamily: 'Edwardian Script ITC', fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
