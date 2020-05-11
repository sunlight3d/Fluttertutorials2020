import 'package:flutter/material.dart';
import './models/category.dart';
import './models/food.dart';
//This data is for testing only, donot use !
const FAKE_CATEGORIES = const [
  Category(id: 1, content: 'Japanese\'s Foods', color: Colors.deepOrange),
  Category(id: 2, content: 'Pizza', color: Colors.teal),
  Category(id: 3, content: 'Humburgers', color: Colors.pink),
  Category(id: 4, content: 'Italian', color: Colors.blueAccent),
  Category(id: 5, content: 'Milk & Yoghurt', color: Colors.deepPurple),
  Category(id: 6, content: 'Vegetables', color: Colors.green),
  Category(id: 7, content: 'Fruits', color: Colors.redAccent),
];
var FAKE_FOODS = [
  Food(
    name: "sushi - 寿司", 
    urlImage: "https://upload.wikimedia.org/wikipedia/commons/c/cf/Salmon_Sushi.jpg", 
    duration: Duration(minutes:25),
    ingredients: ['Sushi-meshi', 'Nori', 'Condiments'],
    categoryId: 1),
  Food(
    name: "Pizza tonda", 
    urlImage: "https://upload.wikimedia.org/wikipedia/commons/4/4f/Pizza_con_acciughe_e_cipolla.JPG", 
    duration: Duration(minutes:15),
    ingredients: ['Tomato sauce','Fontina cheese','Pepperoni','Onions','Mushrooms','pepperoncini'],
    categoryId: 2),
  Food(
    name: "Makizushi", 
    urlImage: "https://upload.wikimedia.org/wikipedia/commons/0/0b/KansaiSushi.jpg", 
    duration: Duration(minutes:20),
    categoryId: 1),
  Food(
    name: "Tempura", 
    urlImage: "https://upload.wikimedia.org/wikipedia/commons/a/ac/Peixinhos_da_horta.jpg", 
    duration: Duration(minutes: 15),
    categoryId: 1),
  Food(
    name: "Neapolitan pizza", 
    urlImage: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Kartoffel_pizza_%28with_border%29.jpg/2880px-Kartoffel_pizza_%28with_border%29.jpg", 
    duration: Duration(minutes:20),
    ingredients: ['Fontina cheese','Tomato sauce','Onions','Mushrooms'],
    categoryId: 2),
  Food(
    name: "Sashimi", 
    urlImage: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Sashimi_-_Tokyo_-_Japan.jpg/2880px-Sashimi_-_Tokyo_-_Japan.jpg", 
    duration: Duration(hours: 1, minutes: 5),
    categoryId: 1),
  Food(
    name: "Homemade Humburger", 
    urlImage: "https://upload.wikimedia.org/wikipedia/commons/5/58/Homemade_hamburger.jpg", 
    duration: Duration(minutes: 20),
    categoryId: 3),  
];