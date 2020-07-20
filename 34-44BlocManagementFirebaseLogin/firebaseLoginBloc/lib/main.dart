import 'package:firebaseLoginBloc/blocs/authentication_bloc.dart';
import 'package:firebaseLoginBloc/blocs/login_bloc.dart';
import 'package:firebaseLoginBloc/blocs/simple_bloc_observer.dart';
import 'package:firebaseLoginBloc/events/authentication_event.dart';
import 'package:firebaseLoginBloc/pages/home_page.dart';
import 'package:firebaseLoginBloc/pages/login_page.dart';
import 'package:firebaseLoginBloc/pages/splash_page.dart';
import 'package:firebaseLoginBloc/repositories/user_repository.dart';
import 'package:firebaseLoginBloc/states/authentication_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//In this lesson, we will build User Interface(UI)
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    //signout for testing firstly !

    return MaterialApp(
      title: 'Login with Firebase',
      home: BlocProvider(
        create: (context) => AuthenticationBloc(userRepository: _userRepository)
                            ..add(AuthenticationEventStarted()),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, authenticationState) {
            if(authenticationState is AuthenticationStateSuccess) {
              return HomePage();
            } else if(authenticationState is AuthenticationStateFailure) {
              return BlocProvider<LoginBloc>(
                create: (context) => LoginBloc(userRepository: _userRepository),
                child: LoginPage(userRepository: _userRepository,)//LoginPage,
              );
            }
            return SplashPage();
          },
        ),
      )
    );
  }
}