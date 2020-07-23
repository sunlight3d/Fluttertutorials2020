//the same with login_bloc
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebaseLoginBloc/events/register_event.dart';
import 'package:firebaseLoginBloc/repositories/user_repository.dart';
import 'package:firebaseLoginBloc/states/register_state.dart';
import 'package:firebaseLoginBloc/validators/validators.dart';
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
        isValidEmail: Validators.isValidEmail(registerEvent.email),
      );
    } else if (registerEvent is RegisterEventPasswordChanged) {
      yield state.cloneAndUpdate(
        isValidPassword: Validators.isValidPassword(registerEvent.password),
      );
    } else if (registerEvent is RegisterEventPressed) {
      yield RegisterState.loading();
      try {
        await _userRepository.createUserWithEmailAndPassword(
          registerEvent.email,
          registerEvent.password,
        );
        yield RegisterState.success();
      } catch (exception) {
        yield RegisterState.failure();
      }
    }
  }
}

