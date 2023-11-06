import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/about_internship': (context) => AboutInternshipPage(),
        '/dart_contents': (context) => DartContentsPage(),
        '/flutter_contents': (context) => FlutterContentsPage(),
        '/feedback': (context) => FeedbackPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 5), // Set a 5px right margin
                child:ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about_internship');
              },
              child: Text('About Internship'),
            ),
              ),
              Container(
                margin: EdgeInsets.only(right: 5), // Set a 5px right margin
                child:ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dart_contents');
              },
              child: Text('Dart Contents'),
            ),
              ),
              Container(
                margin: EdgeInsets.only(right: 5), // Set a 5px right margin
                child:ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/flutter_contents');
              },
              child: Text('Flutter Contents'),
            ),
              ),
              Container(
                margin: EdgeInsets.only(right: 5), // Set a 5px right margin
                child:ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/feedback');
              },
              child: Text('Feedback'),
            ),
              ),
            
          ],
        ),
      ),
    );
  }
}

// Rest of the classes go here...
class ElementCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  ElementCard(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class AboutInternshipPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Internship"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "About Internship",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
                   'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 
                    style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                ),
             ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.network(
                  'https://picsum.photos/100',
                  height: 100,
                  width: 100,
                ),
                Image.network(
                  'https://picsum.photos/100',
                  height: 100,
                  width: 100,
                ),
                Image.network(
                  'https://picsum.photos/100',
                  height: 100,
                  width: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class DartContentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contents of Dart"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Contents of Dart",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text("1) Adding the element to list"),
            Text("2) Removing an element"),
            Text("3) To find the length of the list in the center of the page"),
          ],
        ),
      ),
    );
  }
}

class FlutterContentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contents of Dart"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Contents of Flutter",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text("1) Adding the element to list"),
            Text("2) Removing an element"),
            Text("3) To find the length of the list in the center of the page"),
          ],
        ),
      ),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Feedback",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(height: 30, color: Colors.black),
            Text("Please write your feedback below"),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("How do you rate your overall experience?"),
            ),
            Row(
              children: [
                FeedbackOption("Bad"),
                FeedbackOption("Average"),
                FeedbackOption("Good"),
              ],
            ),
            
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Full name*"),
                      TextFormField(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email*"),
                      TextFormField(),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Age*"),
                      TextFormField(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone*"),
                      TextFormField(),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Message*"),
            ),
            TextFormField(
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add code to submit feedback
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedbackOption extends StatelessWidget {
  final String optionText;

  FeedbackOption(this.optionText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(optionText),
        Radio(value: null, groupValue: null, onChanged: null),
      ],
    );
  }
}
