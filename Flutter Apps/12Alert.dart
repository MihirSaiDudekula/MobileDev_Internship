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
  void _showAlertdialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert Dialog"),
          content: Text("This is a basic alert dialog."),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
                /*
                Navigator is a widget that manages a set of child widgets with a stack discipline. 
                It allows you to navigate between different screens or pages in your app
                .of(context) retrieves the nearest Navigator ancestor in the widget tree.
                .pop() is a method used to close the current screen or dialog.
                */
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Alert Dialog Example"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showAlertdialog(context);
            {print('clicked');}
          },
          child: Text("Show Alert Dialog"),
          
        ),
      ),
    );
  }
}
