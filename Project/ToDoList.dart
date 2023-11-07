import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(AppName());
}

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool showContactInfo = false;
  TextEditingController createAccountController = TextEditingController();
  String userName = '';

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
          'ToDoList',
          style: TextStyle(color: Colors.red),
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
              if (userName.isNotEmpty) Text('Hello $userName', style: TextStyle(color: Colors.red)),
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
//                 Navigator.pop(context);
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
      body: TodoList(),
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
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          color: Colors.blue[200],
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 16), // Add spacing here
                child: TextField(
                  controller: taskNameController,
                  decoration: InputDecoration(
                    labelText: 'Enter Task Name', // Change the label here
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search tasks',
                  border: OutlineInputBorder(),
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
                    color: Colors.blue,
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
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : ListView.builder(
                  itemCount: filteredTodos.length,
                  itemBuilder: (context, index) {
                    final todo = filteredTodos[index];
                    return Card(
                      margin: EdgeInsets.all(8),
                      color: todo.isCompleted ? Colors.green : Colors.white,
                      child: ListTile(
                        title: Text(
                          todo.name,
                          style: TextStyle(
                            fontSize: 18,
                            decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
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
                              icon: Icon(todo.isCompleted ? Icons.check_box : Icons.check_box_outline_blank),
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

