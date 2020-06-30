import 'package:loginwithbloc/events/authentication_event.dart';
import 'package:loginwithbloc/repositories/user_repository.dart';
import 'package:loginwithbloc/states/authentication_state.dart';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  @override
  // TODO: implement initialState
  AuthenticationState get initialState => AuthenticationStateInitial();
  AuthenticationBloc({@required this.userRepository}):assert(userRepository != null);
  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    //from event => state changes
    if(event is AuthenticationEventStarted) {
      //check "is logged in" ?
      final hasToken = await this.userRepository.hasToken();
      if(hasToken) {
        yield AuthenticationStateSuccess();
      } else {
        yield AuthenticationStateFailed();
      }
    } else if(event is AuthenticationEventLoggedIn) {
      yield AuthenticationStateInProgress();
      await this.userRepository.saveToken(event.tokenKey);
      yield AuthenticationStateSuccess();
    } else if(event is AuthenticationEventLoggedOut) {
      yield AuthenticationStateInProgress();
      await this.userRepository.removeToken();
      yield AuthenticationStateSuccess();
    }
  }
  //Now develop UI ?
}