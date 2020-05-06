import 'package:flutter/material.dart';
import 'package:myapp/category_item.dart';
import 'package:myapp/fake_data.dart';
class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(
      padding: EdgeInsets.all(12),
      children: FAKE_CATEGORIES.map((eachCategory) => CategoryItem(category: eachCategory)).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ),
    );
  }
}