import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: CenteredTexts(),
    );
  }

}

class CenteredTexts extends StatelessWidget{
  const CenteredTexts({super.key});
    @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Name Here'),
        body:const Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Name:Your Name',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height:20),
              Text(
                'USN: your usn',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Department:your department',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }




}
