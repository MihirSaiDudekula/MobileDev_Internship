import 'package:flutter/material.dart';

void main() {
  runApp(Appname());
}

class Appname extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//for removing the debug show check from the top right corner
      home: HomeScreen(),
    );
  }
}
//creating statefulwidget
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showContactInfo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime Recommendation app'),
        centerTitle: true,//this is to center the text on the appbar
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);// Close the drawer
              // used to navigate back to the home screen
                Navigator.pushReplacement(   //replaces current route with new one
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail), //for creating icons
              title: Text('Contact Us'),
              onTap: () {
                
                // Navigator.pop(context);
                // By toggling showContactInfo from true to false or vice versa, you control whether the contact information is displayed or hidden.
                setState(() {
                  showContactInfo = !showContactInfo;
                });
              },
            ),
            if (showContactInfo)
              ListTile(
                title: Text('Phone: +9196329XXXXX\nEmail: anireccapp@gmail.com'),
              ),
          ],
        ),
      ),
    );
  }
}
