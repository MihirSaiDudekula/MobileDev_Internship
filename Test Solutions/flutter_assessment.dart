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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about_internship');
              },
              child: Text('About Internship'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dart_contents');
              },
              child: Text('Dart Contents'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/flutter_contents');
              },
              child: Text('Flutter Contents'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/feedback');
              },
              child: Text('Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}

// Rest of the classes go here...

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
      ),

      body: SingleChildScrollView(
  child: Container(
    color: Colors.blue, // Set background color to blue
    padding: EdgeInsets.all(20.0),
    child: Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Feedback',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Please write your feedback below',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              RadioOption('Bad'),
              RadioOption('Average'),
              RadioOption('Good'),
            ],
          ),
          SizedBox(height: 10),
          InputField(label: 'Full Name', hintText: 'Enter your full name'),
          InputField(label: 'Age', hintText: 'Enter your age'),
          InputField(label: 'Email', hintText: 'Enter your email'),
          InputField(label: 'Phone', hintText: 'Enter your phone number'),
          SizedBox(height: 10),
          Text(
            'Message',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          TextFormField(
            maxLines: 5,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Checkbox(value: false, onChanged: null),
              Text(
                'I agree to the Terms and Conditions',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add code to submit feedback
            },
            child: Text('Submit'),
          ),
        ],
      ),
    ),
  ),
),
//   ),
// ),

    );
  }
}

class RadioOption extends StatelessWidget {
  final String optionText;

  RadioOption(this.optionText);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(value: optionText, groupValue: null, onChanged: null),
        Text(optionText, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final String hintText;

  InputField({required this.label, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white)),
        TextFormField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
        SizedBox(height: 10),
      ],
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
        title: Text("Contents of Flutter"),
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
