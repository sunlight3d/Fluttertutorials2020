import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/comment.dart';

class InfiniteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Data is get from API Server()
    //we use JSONPlaceHolder for testing
    //https://jsonplaceholder.typicode.com/comments?_start=1&_limit=20
    //page 1, 20 items
    //Now test
    _getCommentsFromApi(0, 20);
    return Scaffold(
      body: SafeArea(
        child: Text('Infinite List using Bloc', style: TextStyle(fontSize: 30),),
      ),
    );
  }
  _getCommentsFromApi(int page, int limit) {
    final url = 'https://jsonplaceholder.typicode.com/comments?_start=$page&_limit=$limit';
    http.Client().get(url).then((response) {
      if(response.statusCode == 200) {
        final responseData = json.decode(response.body) as List;
        final List<Comment> comments = responseData.map((element){
          return Comment(
            id: element['id'],
            name: element['name'],
            email: element['email'],
            body: element['body']
          );
        }).toList();
        print('haha');
      }
    });
  }
}