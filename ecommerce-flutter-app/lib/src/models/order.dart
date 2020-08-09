import 'dart:math';

import 'package:ecommerce_app_ui_kit/src/models/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

enum OrderState { unpaid, toBeShipped, shipped, inDispute }

class Track {
  String id = UniqueKey().toString();
  String description;
  String currentLocation;
  DateTime dateTime;

  Track(this.description, this.currentLocation, this.dateTime);

  static List<Track> getTrackingList() {
    return [
      new Track('Your Order in local post', 'United State', DateTime.now().subtract(Duration(days: 1))),
      new Track('Your Order arrived in destination', 'United State', DateTime.now().subtract(Duration(days: 5))),
      new Track('Order in aeroport', 'France', DateTime.now().subtract(Duration(days: 8))),
      new Track('Your order oversea in china', 'China', DateTime.now().subtract(Duration(days: 10))),
    ];
  }
}

class Order {
  String id = UniqueKey().toString();
  Product product;
  int quantity = Random().nextInt(10);
  String trackingNumber;
  DateTime dateTime = DateTime.now().subtract(Duration(days: Random().nextInt(20)));
  OrderState orderState;
  List<Track> tracking = Track.getTrackingList();

  Order(this.product, this.trackingNumber, this.orderState);

  getDateTime() {
    return DateFormat('yyyy-MM-dd HH:mm').format(this.dateTime);
  }
}

class OrderList {
  List<Order> _list;

  List<Order> get list => _list;

  OrderList() {
    this._list = [
      new Order(new Product('Digital Display Bracelet Watch', 'img/watch6.webp', 80, 63.98, 200, 2554, 3.1, 10.5),
          'RB4551532214564', OrderState.shipped),
      new Order(new Product('Spring Hand Grip Finger Strength', 'img/sport5.webp', 10, 12.36, 153, 166, 4.2, 11.5),
          'CH4561454563156', OrderState.toBeShipped),
      new Order(new Product('Digital Display Bracelet Watch', 'img/home10.webp', 80, 63.98, 200, 2554, 3.1, 10.5),
          'RB4551532214564', OrderState.unpaid),
      new Order(new Product('Robe pin up', 'img/home2.webp', 10, 12.36, 153, 166, 4.2, 11.5), 'CH456124566652',
          OrderState.shipped),
    ];
  }
}
