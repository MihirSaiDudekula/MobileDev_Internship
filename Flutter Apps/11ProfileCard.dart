import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ramaiah Chairman Profile'),
        ),
        body: const Center(
          child: UserProfile(),
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
              'https://tse4.mm.bing.net/th?id=OIP.Qg7TYqt7lUzqcou6W1YYIwAAAA&pid=Api&P=0&h=220'), // Replace with your image URL
        ),
        SizedBox(height: 20),
        Text(
          'Dr. M.S.Ramaiah',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Founder Chairman',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Mathikere Sampangi Ramaiah was born on 20 April 1922, in Madhugiri to Sampangappa and Narasamma.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
