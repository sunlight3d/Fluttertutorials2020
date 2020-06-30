import 'package:equatable/equatable.dart';
abstract class AuthenticationState extends Equatable{
  @override
  List<Object> get props => [];
}
/*
Some states:
initial, login success / failed, in progress
* */
class AuthenticationStateInitial extends AuthenticationState{}
class AuthenticationStateSuccess extends AuthenticationState{}
class AuthenticationStateFailed extends AuthenticationState{}
class AuthenticationStateInProgress extends AuthenticationState{}
//Now we define bloc !