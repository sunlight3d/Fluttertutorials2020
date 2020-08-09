import 'package:ecommerce_app_ui_kit/src/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Brand {
  String id = UniqueKey().toString();
  String name;
  String logo;
  bool selected;
  double rate;
  List<Product> products;
  Color color;

  Brand(this.name, this.logo, this.color, this.selected, this.rate, this.products);
}

class BrandsList {
  List<Brand> _list;

  List<Brand> get list => _list;

  BrandsList() {
    _list = [
      new Brand('Wilson', 'img/logo-03.svg', Colors.greenAccent, true, 4.3, [
        new Product('Zogaa FlameSweater', 'img/man1.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Polo Shirt Brand Clothing', 'img/man2.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Polo Shirt for Men', 'img/man3.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Sport Pants Long Summer', 'img/man4.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Hoodies Pullovers Striped', 'img/man5.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Double Breasted Suit Vests', 'img/man6.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Puimentiua Summer Fashion', 'img/man7.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Casual Sweater fashion Jacket', 'img/man8.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
      ]),
      new Brand('Converse', 'img/logo-04.svg', Colors.cyan, false, 4.3, [
        new Product('Zogaa FlameSweater', 'img/man1.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Polo Shirt Brand Clothing', 'img/man2.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Polo Shirt for Men', 'img/man3.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Sport Pants Long Summer', 'img/man4.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Hoodies Pullovers Striped', 'img/man5.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Double Breasted Suit Vests', 'img/man6.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Puimentiua Summer Fashion', 'img/man7.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Casual Sweater fashion Jacket', 'img/man8.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
      ]),
      new Brand('Umbro', 'img/logo-05.svg', Colors.blueAccent, false, 4.3, [
        new Product('Zogaa FlameSweater', 'img/man1.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Polo Shirt Brand Clothing', 'img/man2.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Polo Shirt for Men', 'img/man3.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Sport Pants Long Summer', 'img/man4.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Hoodies Pullovers Striped', 'img/man5.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Double Breasted Suit Vests', 'img/man6.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Puimentiua Summer Fashion', 'img/man7.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Casual Sweater fashion Jacket', 'img/man8.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
      ]),
      new Brand('Nike', 'img/logo-06.svg', Colors.orange, false, 4.3, [
        new Product('Zogaa FlameSweater', 'img/man1.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Polo Shirt Brand Clothing', 'img/man2.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Polo Shirt for Men', 'img/man3.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Sport Pants Long Summer', 'img/man4.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Hoodies Pullovers Striped', 'img/man5.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Double Breasted Suit Vests', 'img/man6.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Puimentiua Summer Fashion', 'img/man7.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Casual Sweater fashion Jacket', 'img/man8.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
      ]),
      new Brand('Puma', 'img/logo-07.svg', Colors.pinkAccent, false, 4.3, [
        new Product('Zogaa FlameSweater', 'img/man1.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Polo Shirt Brand Clothing', 'img/man2.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Polo Shirt for Men', 'img/man3.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Sport Pants Long Summer', 'img/man4.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Hoodies Pullovers Striped', 'img/man5.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Double Breasted Suit Vests', 'img/man6.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Puimentiua Summer Fashion', 'img/man7.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Casual Sweater fashion Jacket', 'img/man8.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
      ]),
      new Brand('Acer', 'img/logo-08.svg', Colors.deepPurpleAccent, false, 4.3, [
        new Product('Zogaa FlameSweater', 'img/man1.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Polo Shirt Brand Clothing', 'img/man2.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Polo Shirt for Men', 'img/man3.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Sport Pants Long Summer', 'img/man4.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Hoodies Pullovers Striped', 'img/man5.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Double Breasted Suit Vests', 'img/man6.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Puimentiua Summer Fashion', 'img/man7.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Casual Sweater fashion Jacket', 'img/man8.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
      ]),
      new Brand('Reebook', 'img/logo-09.svg', Colors.brown, false, 4.3, [
        new Product('Zogaa FlameSweater', 'img/man1.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Polo Shirt Brand Clothing', 'img/man2.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Polo Shirt for Men', 'img/man3.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Sport Pants Long Summer', 'img/man4.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Hoodies Pullovers Striped', 'img/man5.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Double Breasted Suit Vests', 'img/man6.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Puimentiua Summer Fashion', 'img/man7.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Casual Sweater fashion Jacket', 'img/man8.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
      ]),
      new Brand('Adidas', 'img/logo-10.svg', Colors.blueAccent, false, 4.3, [
        new Product('Zogaa FlameSweater', 'img/man1.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Polo Shirt Brand Clothing', 'img/man2.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Polo Shirt for Men', 'img/man3.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Sport Pants Long Summer', 'img/man4.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Hoodies Pullovers Striped', 'img/man5.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Double Breasted Suit Vests', 'img/man6.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Puimentiua Summer Fashion', 'img/man7.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Casual Sweater fashion Jacket', 'img/man8.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
      ]),
      new Brand('Crocs', 'img/logo-11.svg', Colors.redAccent, false, 4.3, [
        new Product('Zogaa FlameSweater', 'img/man1.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Polo Shirt Brand Clothing', 'img/man2.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Polo Shirt for Men', 'img/man3.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Sport Pants Long Summer', 'img/man4.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men\'s Hoodies Pullovers Striped', 'img/man5.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Men Double Breasted Suit Vests', 'img/man6.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Puimentiua Summer Fashion', 'img/man7.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
        new Product('Casual Sweater fashion Jacket', 'img/man8.webp', 80, 42.63, 200, 2554, 3.1, 10.5),
      ]),
    ];
  }

  selectById(String id) {
    this._list.forEach((Brand brand) {
      brand.selected = false;
      if (brand.id == id) {
        brand.selected = true;
      }
    });
  }
}
