import 'package:flutter/cupertino.dart';

class UserRepository {
  //after login, if sucessful, we receive a tokenkey
  //maybe it take about 1 second, during that time, you can do other tasks
  //let's use Future / async-await
  Future<String> login({@required String email, @required String password}) async {
    //do something about 1.5 second, but we can "fake"
    await Future.delayed(Duration(milliseconds: 1500));
    return 'ThisIsTokenKeyMayBeARandomString';
  }
  //remove token
  Future<void> removeToken() async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }
  //save token key
  Future<void> saveToken(String tokenKey) async {
    await Future.delayed(Duration(milliseconds: 1000));
    return;
  }
  //check token
  Future<bool> hasToken() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return false;
  }
  //Now what about "event" ?
}