import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {}

class AuthenticationEventStarted extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
