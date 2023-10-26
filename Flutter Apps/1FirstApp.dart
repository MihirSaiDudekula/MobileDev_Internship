import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(  
          title:const Text('RichText Example'),
        ),
        body:Center(  
          child:RichText(
            text:TextSpan(  
            text:'hello',
            style:DefaultTextStyle.of(context).style,
            children:const <TextSpan>[
              TextSpan(  
                text:'bold',
                style:TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
              ),
              TextSpan(
                text:'world!',
                style:TextStyle(fontStyle: FontStyle.italic,color:Colors.green),
              ),
              TextSpan(
                text:'this is a',
                style:TextStyle(color:Colors.black),
              ),
              TextSpan(  
                text:'different color',
                style:TextStyle(color:Colors.red),
              ),
            ])
          )
        )
      )
    );
  }
}
