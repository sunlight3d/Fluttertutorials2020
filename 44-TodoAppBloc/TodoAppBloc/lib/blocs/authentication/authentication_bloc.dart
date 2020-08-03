import 'dart:async';
import 'package:TodoAppBloc/repositories/user_repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(AuthenticationStateInitial());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent authenticationEvent,) async* {
    if (authenticationEvent is AuthenticationEventStarted) {
      try {
        final isAuthenticated = await _userRepository.isAuthenticated();
        if (!isAuthenticated) {
          await _userRepository.authenticate();
        }
        final userId = await _userRepository.getUserId();
        yield AuthenticationStateSuccess(userId);
      } catch (error) {
        yield AuthenticationStateFailed(error: error);
      }
    }
  }
}
