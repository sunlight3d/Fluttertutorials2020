import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/models/category.dart';
class Food {  
  int id;
  String name;
  String urlImage;
  Duration duration;//time to finish this food(meal)
  Complexity complexity;
  List<String> ingredients;
  //reference
  int categoryId;
  Food({    
    @required this.name, 
    @required this.urlImage, 
    @required this.duration, 
    this.complexity, 
    this.ingredients,
    this.categoryId
  }){
    this.id = Random().nextInt(1000);
  }
}
enum Complexity {
  Simple,
  Medium,
  Hard
}