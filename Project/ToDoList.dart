import 'package:flutter/material.dart';
//for the usage of uioverlaystyle
import 'package:flutter/services.dart';

void main() {
  runApp(AppName());
}
//creating a statefulwidget
class AppName extends StatefulWidget {
  @override
  _AppNameState createState() => _AppNameState();
}

class _AppNameState extends State<AppName> {
  ThemeMode _currentThemeMode = ThemeMode.system;
//adding function for toggling between light and dark mode
  void _toggleTheme() {
    setState(() {
      if (_currentThemeMode == ThemeMode.light) {
        _currentThemeMode = ThemeMode.dark;
      } else {
        _currentThemeMode = ThemeMode.light;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,// removal of debug from the top right corner
      home: HomeScreen(_toggleTheme, currentThemeMode: _currentThemeMode),
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white, 
          foregroundColor: Colors.red, 
          iconTheme: IconThemeData(color: Colors.red), 
        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _currentThemeMode,
    );
  }
}
//  properties for toggling the theme and the current theme mode, allowing the widget to be configured with these settings
class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final ThemeMode currentThemeMode;

  HomeScreen(this.toggleTheme, {required this.currentThemeMode});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
//  initializes the index for  tab, a flag to control whether to show contact information, a text controller for creating user accounts, and a user's name stored as an empty string
class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool showContactInfo = false;
  TextEditingController createAccountController = TextEditingController();
  String userName = '';
 //creating account on top right corner
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
              )
            ],
          ),
        );
      },
    );
  }
// displaying information in the contactinfo
  void _showContactInfoScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactScreen(
          name: 'Lokesh and Mihir',
          phoneNumber: '+919632969420',
          email: 'todolist@gmail.com',
          location: 'Bengaluru, India',
        ),
      ),
    );
  }

  void _navigateToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsScreen(
          toggleTheme: widget.toggleTheme,
          currentThemeMode: widget.currentThemeMode,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = widget.currentThemeMode;
    final isDarkMode = themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'ToDoList',
          style: TextStyle(color: Colors.red, fontSize: 30),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.red),
        actions: <Widget>[
          Column(
            children: [
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.red,
                ),
                onPressed: () {
                  _showAccountMenu(context);
                },
              ),
              if (userName.isNotEmpty)
                Text('Hello $userName', style: TextStyle(color: Colors.red)),
            ],
          ),
        ],
      ),
      // creating a drawer 
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            //adding
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
                _showContactInfoScreen(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                _navigateToSettings(context);
              },
            ),
          ],
        ),
      ),
      body: TodoList(currentThemeMode: themeMode),
    );
  }
}

class Todo {
  String name;
  bool isCompleted;

  Todo({
    required this.name,
    this.isCompleted = false,
  });
}

class TodoList extends StatefulWidget {
  final ThemeMode currentThemeMode;

  TodoList({required this.currentThemeMode});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> todos = [];
  List<Todo> filteredTodos = [];

  final taskNameController = TextEditingController();
  final searchController = TextEditingController();

  void addTask() {
    final taskName = taskNameController.text;
    if (taskName.isNotEmpty) {
      setState(() {
        todos.add(Todo(name: taskName));
        taskNameController.clear();
        searchTasks();
      });
    }
  }

  void deleteTask(int index) {
    setState(() {
      todos.removeAt(index);
      searchTasks();
    });
  }

  void toggleCompleted(int index) {
    setState(() {
      todos[index].isCompleted = !todos[index].isCompleted;
    });
  }

  void searchTasks() {
    final search = searchController.text.toLowerCase();
    if (search.isEmpty) {
      setState(() {
        filteredTodos = todos;
      });
    } else {
      setState(() {
        filteredTodos = todos
            .where((todo) => todo.name.toLowerCase().contains(search))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = widget.currentThemeMode;
    final isDarkMode = themeMode == ThemeMode.dark;

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          color: isDarkMode ? Colors.grey[800] : Colors.blue[200],
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: TextField(
                  controller: taskNameController,
                  decoration: InputDecoration(
                    labelText: 'Enter Task Name',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search tasks',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                onChanged: (value) {
                  searchTasks();
                },
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: addTask,
                    color: isDarkMode ? Colors.white : Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: filteredTodos.isEmpty
              ? Center(
                  child: Text(
                    'No matching tasks found.',
                    style: TextStyle(
                      fontSize: 20,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: filteredTodos.length,
                  itemBuilder: (context, index) {
                    final todo = filteredTodos[index];
                    return Card(
                      margin: EdgeInsets.all(8),
                      color: todo.isCompleted
                          ? isDarkMode ? Colors.green : Colors.green
                          : isDarkMode ? Colors.grey : Colors.white,
                      child: ListTile(
                        title: Text(
                          todo.name,
                          style: TextStyle(
                            fontSize: 18,
                            decoration:
                                todo.isCompleted ? TextDecoration.lineThrough : null,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => deleteTask(todos.indexOf(todo)),
                              color: Colors.red,
                            ),
                            IconButton(
                              icon: Icon(todo.isCompleted
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank),
                              onPressed: () => toggleCompleted(todos.indexOf(todo)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class ContactScreen extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String email;
  final String location;

  ContactScreen({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              name,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'Phone Number:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              phoneNumber,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'Email:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'Location:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              location,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final ThemeMode currentThemeMode;

  SettingsScreen({required this.toggleTheme, required this.currentThemeMode});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: widget.currentThemeMode == ThemeMode.dark,
              onChanged: (value) {
                widget.toggleTheme();
              },
            ),
          ),
        ],
      ),
    );
  }
}
