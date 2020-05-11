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
    List<Food> foods = FAKE_FOODS.where((element) => element.categoryId == this.category.id).toList();
    return Scaffold(
      appBar: AppBar(
        // title: Text('Foods from ${category.content}'),
        title: Text('Foods from ${category.content}'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: foods.length,
          itemBuilder: (context, index) {
            Food food = foods[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.hardEdge,
              child: Image.network(food.urlImage),
            );
          }
        ),
      ),
    );
  }
}