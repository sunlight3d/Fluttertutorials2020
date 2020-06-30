import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object> get props => [];
}
//1. an event to check if the user is authenticated or not
class AuthenticationEventStarted extends AuthenticationEvent {

}
//2. an event to notify bloc that "user login successfully"
class AuthenticationEventLoggedIn extends AuthenticationEvent {
  final String tokenKey;
  //constructor
  const AuthenticationEventLoggedIn({@required this.tokenKey});
  @override
  // TODO: implement props
  List<Object> get props => [tokenKey]; //this is used for "comparing object's content"
}
//2. an event to notify bloc that "user logout successfully"
class AuthenticationEventLoggedOut extends AuthenticationEvent {

}
//Now we define states
//events => states