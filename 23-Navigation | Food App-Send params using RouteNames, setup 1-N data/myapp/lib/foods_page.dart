import 'package:flutter/material.dart';
import 'package:myapp/fake_data.dart';
import 'package:myapp/models/category.dart';
import 'package:myapp/models/food.dart';
class FoodsPage extends StatelessWidget {
  static const String routeName = '/FoodsPage';
  Category category;
  FoodsPage({this.category});
  @override
  Widget build(BuildContext context) {
    Map<String, Category> arguments = ModalRoute.of(context).settings.arguments;
    this.category = arguments['category'];
    //Filter foods of from category
    List<Food> foods = FAKE_FOODS.where((food) => food.categoryId == this.category.id).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Foods from ${category.content}'),
      ),
      body: Center(
        child: Center(
          child: ListView.builder(
              itemBuilder: (context, index) {
                //We will continue in the next lesson
              }
          ),
        )
      ),
    );
  }
}