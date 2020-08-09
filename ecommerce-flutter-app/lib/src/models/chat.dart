import 'package:ecommerce_app_ui_kit/src/models/user.dart';
import 'package:flutter/material.dart';

class Chat {
  String id = UniqueKey().toString();
  String text;
  String time;
  User user;

  Chat(this.text, this.time, this.user);
}

//class ChatList{
//  List<Chat> _list;
//
//  ChatList(){
//    _list = [
//      new Chat('Ok', '32 ago')
//      new Chat('Ok', '32 ago')
//    ];
//  }
//}
