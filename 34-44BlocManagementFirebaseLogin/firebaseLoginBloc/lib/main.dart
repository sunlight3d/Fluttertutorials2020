import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login with Firebase',
      home: Scaffold(
        body: Center(
          child: Text('Login with Firebase',style: TextStyle(fontSize: 20),),
        ),
      )
    );
  }
}