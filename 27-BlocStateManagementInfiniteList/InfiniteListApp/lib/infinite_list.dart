import 'package:flutter/material.dart';

class InfiniteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Data is get from API Server()
    //we use JSONPlaceHolder for testing
    //https://jsonplaceholder.typicode.com/comments?_start=1&_limit=20
    return Scaffold(
      body: SafeArea(
        child: Text('Infinite List using Bloc', style: TextStyle(fontSize: 30),),
      ),
    );
  }
}