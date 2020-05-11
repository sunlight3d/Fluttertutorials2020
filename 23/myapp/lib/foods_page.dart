import 'package:flutter/material.dart';
import 'package:myapp/models/category.dart';
class FoodsPage extends StatelessWidget {
  final Category category;
  FoodsPage({this.category});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Foods from ${category.content}'),
      ),
      body: Center(
        child: Text(
            'This show Foods\'s list',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}