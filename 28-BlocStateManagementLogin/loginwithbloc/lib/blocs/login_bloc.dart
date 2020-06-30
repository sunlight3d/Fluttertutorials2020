import 'package:flutter/cupertino.dart';
import 'package:loginwithbloc/blocs/authentication_bloc.dart';
import 'package:loginwithbloc/events/authentication_event.dart';
import 'package:loginwithbloc/events/login_event.dart';
import 'package:loginwithbloc/repositories/user_repository.dart';
import 'package:loginwithbloc/states/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  //this bloc depends on AuthenticationBloc
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc
  }): assert(userRepository != null),
      assert(authenticationBloc != null);
  @override
  // TODO: implement initialState
  LoginState get initialState => LoginStateInitial();
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if(event is LoginEventButtonPressed) {
      yield LoginStateInProgress();
      try {
        final tokenKey = await userRepository
            .login(email: event.email, password: event.password);
        if(tokenKey.length > 0) {
          //success
          authenticationBloc.add(AuthenticationEventLoggedIn(tokenKey: tokenKey));
          yield LoginStateInitial();
        } else {
          yield LoginStateFailed(error: 'Cannot get tokenKey');
        }
      }catch(error) {
        yield LoginStateFailed(error: error.toString());
      }
    }
  }
}