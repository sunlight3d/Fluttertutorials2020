import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebaseLogin/events/login_event.dart';
import 'package:firebaseLogin/repositories/user_repository.dart';
import 'package:firebaseLogin/states/login_state.dart';
import 'package:firebaseLogin/validations.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;
  final DEBOUNCE_TIME_MILISECONDS = 300;
  LoginBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository,
        super(LoginState.initial());

  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
      Stream<LoginEvent> events,
      TransitionFunction<LoginEvent, LoginState> transitionFunction,
      ) {
    final nonDebounceStream = events.where((event) {
      return (event is! LoginEventEmailChanged && event is! LoginEventPasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (event is LoginEventEmailChanged || event is LoginEventPasswordChanged);
    }).debounceTime(Duration(milliseconds: DEBOUNCE_TIME_MILISECONDS));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFunction,
    );
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent loginEvent) async* {
    if (loginEvent is LoginEventEmailChanged) {
      yield state.cloneAndUpdate(
        isValidEmail: Validations.isValidEmail(loginEvent.email),
      );
    } else if (loginEvent is LoginEventPasswordChanged) {
      yield state.cloneAndUpdate(
        isValidPassword: Validations.isValidEmail(loginEvent.password),
      );
    } else if (loginEvent is LoginEventWithGooglePressed) {
      try {
        await _userRepository.signInWithGoogle();
        yield LoginState.success();
      } catch (_) {
        yield LoginState.failure();
      }
    } else if (loginEvent is LoginEventWithEmailAndPasswordPressed) {
      yield LoginState.loading();
      try {
        await _userRepository.signInWithCredentials(loginEvent.email, loginEvent.password);
        yield LoginState.success();
      } catch (_) {
        yield LoginState.failure();
      }
    }
  }
}
