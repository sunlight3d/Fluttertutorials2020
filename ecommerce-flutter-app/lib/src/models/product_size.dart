import 'package:flutter/material.dart';

class ProductSize {
  String id = UniqueKey().toString();
  String code;
  String name;
  bool selected;

  ProductSize(this.code, this.name, this.selected);
}

class ProductSizesList {
  List<ProductSize> _list;

  List<ProductSize> get list => _list;

  ProductSizesList() {
    _list = [
      new ProductSize('XS', 'Extra Small', true),
      new ProductSize('S', 'Small', true),
      new ProductSize('M', 'Medium', false),
      new ProductSize('L', 'Large', true),
      new ProductSize('XL', 'Extra Large', false),
      new ProductSize('XXL', '2 Extra Large', false),
    ];
  }
  void clearSelection() {
    _list.forEach((size) {
      size.selected = false;
    });
  }
}
