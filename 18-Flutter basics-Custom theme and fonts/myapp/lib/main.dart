
import 'package:flutter/material.dart';
import 'MyApp.dart';
void main(){
  //Center is a widget, Text is a widget
  runApp(MaterialApp(
    title: 'Transaction app',
    theme: ThemeData(
      primaryColor: Colors.green[300],
      accentColor: Colors.pink[400],
      appBarTheme: AppBarTheme(
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'Indie_Flower',
            fontSize: 20,
            color: Colors.pink,
            fontWeight: FontWeight.bold
          )
        )
      )
    ),
    home: MyApp(),
    //Now I want to change the "global" fonts
  ));
}



