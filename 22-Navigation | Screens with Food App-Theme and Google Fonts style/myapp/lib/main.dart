import 'package:flutter/material.dart';
import 'package:myapp/categories_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App with Navigation',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Itim',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 52, 52, 1)
          ),
            body2: TextStyle(
                color: Color.fromRGBO(20, 52, 52, 1)
            ),
          title: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontFamily: 'Sunshiney',
          )
        )
      ),
      home: Scaffold(
        appBar: AppBar(
//          centerTitle: false,
          title: const Text('Food\'s categories' ),
        ),
        body: SafeArea(child: CategoriesPage(),)
      ),
    );
  }
}
