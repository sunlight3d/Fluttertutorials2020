//do the same as "Login Event"
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
//Now we define BloC
abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterEventEmailChanged extends RegisterEvent {
  final String email;
  const RegisterEventEmailChanged({@required this.email});
  @override
  List<Object> get props => [email];
  @override
  String toString() => 'RegisterEventEmailChanged, email :$email';
}

class RegisterEventPasswordChanged extends RegisterEvent {
  final String password;

  const RegisterEventPasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'RegisterEventPasswordChanged, password: $password';
}

class RegisterEventPressed extends RegisterEvent {
  final String email;
  final String password;

  const RegisterEventPressed({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return 'RegisterEventPressed, email: $email, password: $password';
  }
}
