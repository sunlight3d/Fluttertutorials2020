import 'package:flutter/material.dart';
class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("This is CounterApp", style: TextStyle(fontSize: 30),),
      ),
    );
  }
}