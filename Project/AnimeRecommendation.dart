import 'package:flutter/material.dart';
// this for the usage of systemoverlay style
import 'package:flutter/services.dart';  



void main() {
  runApp(Appname());
}

class Appname extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent));
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

//adding function for showing account data
void _showAccountMenu(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('Account Menu'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context);
              

               // Close the account menu
              
            },
            child: Text('Create Account'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context); // Close the account menu
              
            },
            child: Text('Other Option'),
          ),
        ],
      );
    },
  );
}

class _HomeScreenState extends State<HomeScreen> {
  bool showContactInfo = false;
TextEditingController nameController = TextEditingController(); // Controller for the user's name
String Name =''; //this is for storing user name
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF5),
      appBar: AppBar(
        backgroundColor: Color(0xFFEEEFF5),
        elevation: 0,//shadow between appbar and body disappers
        title: Text('Anime Recommendation app',style: TextStyle(color: Colors.red),),
        
        centerTitle: true,//this is to center the text on the appbar
        iconTheme: IconThemeData(color: Colors.red), // Setting the color of the drawer icon 
          actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle,//account icon
              color: Colors.red, // Color of the account icon
            ),
            onPressed: () {
              _showAccountMenu(context);
            },
          ),
        ],
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
                
                Navigator.pop(context);
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



























        
        
           
    
  
   
 
