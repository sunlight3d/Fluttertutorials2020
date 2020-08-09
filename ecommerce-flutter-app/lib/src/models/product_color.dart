import 'package:flutter/material.dart';

class ProductColor {
  String id = UniqueKey().toString();
  Color color;
  String name;
  bool selected;

  ProductColor(this.color, this.name, this.selected);
}

class ProductColorsList {
  List<ProductColor> _list;

  List<ProductColor> get list => _list;

  ProductColorsList() {
    _list = [
      new ProductColor(Colors.blueAccent, 'Blue', true),
      new ProductColor(Colors.greenAccent, 'Green', true),
      new ProductColor(Colors.blueGrey, 'Blue Grey', false),
      new ProductColor(Colors.cyanAccent, 'Cyan', true),
      new ProductColor(Colors.deepPurpleAccent, 'Purple', false),
    ];
  }

  void clearSelection() {
    _list.forEach((color) {
      color.selected = false;
    });
  }
}
