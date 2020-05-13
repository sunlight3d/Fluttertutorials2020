import 'package:flutter/material.dart';
import 'package:myapp/fake_data.dart';
import 'package:myapp/models/category.dart';
import 'package:myapp/models/food.dart';
import 'package:transparent_image/transparent_image.dart';

import 'detail_food_page.dart';

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
        child:
        foods.length == 0 ? Text('No foods found', style: TextStyle(fontSize: 25),) :
        ListView.builder(
          itemCount: foods.length,
          itemBuilder: (context, index) {
            Food food = foods[index];          
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => DetailFoodPage(food: food)//you can send parameters using constructor
                    ));

              },
              child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        clipBehavior: Clip.hardEdge,
                        child: Center(
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/loading.gif',
                              image: food.urlImage,
                            )
                        ),
                        //child: Image.network(food.urlImage),
                      ),),
                    Positioned(
                        top: 30,
                        left: 30,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white, width: 2)
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.timer, color: Colors.white, size: 25,),
                                SizedBox(width: 5,),
                                Text('${food.duration.inMinutes} minutes',style: TextStyle(fontSize: 22, color: Colors.white),),
                              ],)
                        )
                    ),
                    Positioned(
                        top: 30,
                        right: 30,
                        child: Container(
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: <Widget>[
                                Text('${food.complexity.toString().split('.').last}',style: TextStyle(fontSize: 22, color: Colors.black),),
                              ],)
                        )
                    ),
                    Positioned(
                        bottom: 30,
                        right: 30,
                        child: Container(
                          child: Text('${food.name}',style: TextStyle(fontSize: 30, color: Colors.white),),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(10)
                          ),
                        )
                    )
                  ]
              ),
            );
          }
        ),
      ),
    );
  }
}