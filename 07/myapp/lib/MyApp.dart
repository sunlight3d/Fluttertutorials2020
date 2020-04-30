import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//You can define your own Widget
class MyApp extends StatefulWidget {
  //StatefulWidget has internal "state"
  String name;
  int age;
  MyApp({this.name, this.age});//name, age is state ? No !, it is properties
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp> {
  String _email;//This is state!
  @override
  Widget build(BuildContext context) {
    //Now add a state ?
    return MaterialApp(
      title: "This is a StatefulWidget",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10)
                        ),
                      ),
                      labelText:'Enter your email',
                  ),
                ),
              ),
              Text(
                'This is line 2',
                style: TextStyle(fontSize: 30, color: Colors.blueAccent),
              ),
              Text(
                'This is line 3',
                style: TextStyle(fontSize: 30, color: Colors.green),
              ),
            ],
          )
        ),
      )
    );
  }
}