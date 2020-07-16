import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebaseLogin/events/register_event.dart';
import 'package:firebaseLogin/repositories/user_repository.dart';
import 'package:firebaseLogin/states/register_state.dart';
import 'package:firebaseLogin/validations.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(RegisterState.initial());

  @override
  Stream<Transition<RegisterEvent, RegisterState>> transformEvents(
      Stream<RegisterEvent> events,
      TransitionFunction<RegisterEvent, RegisterState> transitionFn,
      ) {
    final nonDebounceStream = events.where((event) {
      return (event is! RegisterEventEmailChanged &&
          event is! RegisterEventPasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (event is RegisterEventEmailChanged ||
          event is RegisterEventPasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent registerEvent) async* {
    if (registerEvent is RegisterEventEmailChanged) {
      yield state.cloneAndUpdate(
        isValidEmail: Validations.isValidEmail(registerEvent.email),
      );
    } else if (registerEvent is RegisterEventPasswordChanged) {
      yield state.cloneAndUpdate(
        isValidPassword: Validations.isValidPassword(registerEvent.password),
      );
    } else if (registerEvent is RegisterEventPressed) {
      yield RegisterState.loading();
      try {
        await _userRepository.signUp(
          email: registerEvent.email,
          password: registerEvent.password,
        );
        yield RegisterState.success();
      } catch (_) {
        yield RegisterState.failure();
      }
    }
  }
}
