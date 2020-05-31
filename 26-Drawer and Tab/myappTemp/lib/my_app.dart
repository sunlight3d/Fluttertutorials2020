import 'package:flutter/material.dart';
import 'categories_page.dart';
import 'foods_page.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    print('build in MyApp');
    return MaterialApp(
      title: 'Food App with Navigation',
      initialRoute: '/',//this is "root"
      routes: {
        '/FoodsPage': (context) => FoodsPage(),
        '/CategoriesPage': (context) => CategoriesPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Itim',
      ),
      home: Scaffold(
          appBar: AppBar(
//          centerTitle: false,
            title: const Text('Food\'s categories' ),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          body: SafeArea(child: CategoriesPage(),)
      ),
    );
  }
}