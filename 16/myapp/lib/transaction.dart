import 'package:flutter/material.dart';
class Transaction {
  String content;
  double amount;
  DateTime createdDate;
  //constructor
  Transaction({this.content, this.amount, this.createdDate});
  @override
  String toString() {
    // TODO: implement toString
    return 'content: $content, amount: $amount';
  }
}