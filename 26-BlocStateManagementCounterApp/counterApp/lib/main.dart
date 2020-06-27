import 'package:counterApp/counter_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Now we need to install bloc
  //We have 2 Events => Increase / Descrease
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: CounterPage()
    );
  }
}

