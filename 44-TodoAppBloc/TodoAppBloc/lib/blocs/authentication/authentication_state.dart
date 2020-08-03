import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationStateInitial extends AuthenticationState {}

class AuthenticationStateSuccess extends AuthenticationState {
  final String userId;

  const AuthenticationStateSuccess(this.userId);

  @override
  List<Object> get props => [userId];

  @override
  String toString() => 'Authenticate success with userId: $userId';
}

class AuthenticationStateFailed extends AuthenticationState {
  final error;
  AuthenticationStateFailed({this.error});
}
