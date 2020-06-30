import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
abstract class LoginState extends Equatable {
  const LoginState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class LoginStateInitial extends LoginState{}
class LoginStateInProgress extends LoginState {}
class LoginStateSuccess extends LoginState {}
class LoginStateFailed extends LoginState {
  final String error;
  const LoginStateFailed({@required this.error});
  @override
  // TODO: implement props
  List<Object> get props => [error];
  @override
  String toString() => 'Login failed: ${error}';
}
