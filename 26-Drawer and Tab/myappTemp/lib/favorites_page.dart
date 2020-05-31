import 'package:flutter/material.dart';
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build in FavoritesPage');
    return Center(
      child: Text('Favorites', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
    );
  }
}