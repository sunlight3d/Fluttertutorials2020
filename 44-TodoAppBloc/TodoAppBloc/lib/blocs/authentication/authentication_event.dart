import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {}

class AuthenticationEventAppStarted extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
