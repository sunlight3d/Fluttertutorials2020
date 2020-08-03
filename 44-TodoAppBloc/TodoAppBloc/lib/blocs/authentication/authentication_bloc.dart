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
        super(AuthenticationStateStarted());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent authenticationEvent,) async* {
    if (authenticationEvent is AuthenticationEventAppStarted) {
      try {
        final isSignedIn = await _userRepository.isAuthenticated();
        if (!isSignedIn) {
          await _userRepository.authenticate();
        }
        final userId = await _userRepository.getUserId();
        yield AuthenticationStateSuccess(userId);
      } catch (_) {
        yield AuthenticationStateFailed();
      }
    }
  }
}
