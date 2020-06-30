import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
  const LoginEvent();
}
class LoginEventButtonPressed extends LoginEvent {
  final String email, password;
  //constructor
  const LoginEventButtonPressed({
    @required this.email,
    @required this.password
  });
  @override
  // TODO: implement props
  List<Object> get props => [email, password];
  @override
  String toString() => 'LoginEventButtonPressed, email = ${email}, password = ${password}';
}