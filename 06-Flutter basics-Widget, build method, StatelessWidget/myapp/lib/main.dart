import 'package:flutter/material.dart';

void main(){
    //Center is a widget, Text is a widget
    runApp(
        MyApp(name: 'Hoang',age: 18)//How to send arguments/params to this Widget ?
    );
}
//You can define your own Widget
class MyApp extends StatelessWidget {
    //Let's define a constructor here
    String name;
    int age;

    MyApp({this.name, this.age});
    //StatelessWidget: widget which donot have "state"(property which has been changed <-> User Interface)
    @override
    Widget build(BuildContext context) {
      // build: abstract method from parent class(StatelessWidget)
      return MaterialApp(
        title: "This is my first app",
        home: Scaffold(
          body: Center(child: Text(
              "Mr Hoang, name: $name, age : $age",
              //How to increase TextSize ?
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
              ),
              textDirection: TextDirection.ltr//left-to-right
          )),)
      );
    }
}


