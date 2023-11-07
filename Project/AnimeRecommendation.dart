import 'package:flutter/material.dart';
 // this for the usage of systemoverlay style
import 'package:flutter/services.dart';

void main() {
  runApp(AppName());
}

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(//using system overlay style 
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,//for removing the debug show check from the top right corner
      home: HomeScreen(),
    );
  }
}
//implementing the usage of the search tab
class SearchListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
         
            decoration: BoxDecoration(  
              color:Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
           child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon( 
                Icons.search,
                color: Colors.black,
              )
            ),
           ),
            )]
          );
        
      
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int _currentIndex = 0; // initializing currentindex to 0 for the Home tab
  bool showContactInfo = false;
  TextEditingController createAccountController = TextEditingController();// Controller for the user's name
  String userName = '';
   // defining a list to switch between tab in bottom navigation bar 
  final List<Widget> pages = [
    
    Container(
      color: Colors.red,
      child: Center(child: Text('Home Page')),
    ),
      SearchListScreen(), 
    Container(
      color: Colors.green,
      child: Center(child: Text('Watchlist Page')),
    ),
  ];

  void _showAccountMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Account'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: createAccountController,
                decoration: InputDecoration(labelText: 'Enter Your Name'),
              ),
              Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (createAccountController.text.isNotEmpty) {
                        setState(() {
                          userName = createAccountController.text;
                        });
                      }
                    },
                    child: Text('Create Account'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF5),
      appBar: AppBar(
        backgroundColor: Color(0xFFEEEFF5),
        elevation: 0,
        title: Text(
          'Anime Recommendation app',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,//this is to center the text on the appbar
        iconTheme: IconThemeData(color: Colors.red),// Setting the color of the drawer icon 
        actions: <Widget>[
          Column(
            children: [
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.red,// Color of the account icon
                ),
                onPressed: () {
                  _showAccountMenu(context);
                },
              ),
              if (userName.isNotEmpty) Text('Hello $userName',style:TextStyle(color:Colors.red)),
            ],
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
                Navigator.pushReplacement(        //replaces current route with new one
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),//for creating icons
              title: Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
                // By changing showContactInfo from true to false, we can control whether the contact information is displayed or hidden.
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
       body: _currentIndex==1? SearchListScreen():Container(), //this line of code dynamically changes the body content of the Scaffold based on which tab is currently selected in the bottom navigation bar. 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,//used for keeping track of the tabs in bottom navigation bar
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Watchlist',
          ),
        ]
      )
    );
  }
}




















        
        
           
    
  
   
 
