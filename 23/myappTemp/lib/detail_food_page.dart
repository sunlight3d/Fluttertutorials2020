import 'package:flutter/material.dart';

import 'models/food.dart';

class DetailFoodPage extends StatelessWidget {
  final Food food;
  DetailFoodPage({this.food});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: food.urlImage,
                )
            ),
            Text('Ingredients', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ListView.builder(
                itemBuilder: (context, index) {
                  String ingredient = this.food.ingredients[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text('$index'),),
                    title: Text(ingredient, style: TextStyle(fontSize: 16),),
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}