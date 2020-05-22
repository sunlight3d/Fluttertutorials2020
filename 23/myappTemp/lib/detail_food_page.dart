import 'package:flutter/material.dart';

import 'models/food.dart';

class DetailFoodPage extends StatelessWidget {
  final Food food;
  DetailFoodPage({this.food});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('${food.name}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: food.urlImage,
              )
          ),
          Text('Ingredients', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Expanded(
            child: ListView.builder(
                itemCount: this.food.ingredients.length,
                itemBuilder: (context, index) {
                  String ingredient = this.food.ingredients[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('\#${index + 1}', style:
                        TextStyle(fontSize: 20, color: Colors.white),),
                      backgroundColor: Colors.redAccent,),
                    title: Text(ingredient, style: TextStyle(fontSize: 18),),
                  );
                }
            ),
          ),        ],
      ),
    );
  }
}