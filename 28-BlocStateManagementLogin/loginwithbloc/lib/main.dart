import 'package:flutter/material.dart';
import 'package:loginwithbloc/blocs/authentication_bloc.dart';
import 'package:loginwithbloc/events/authentication_event.dart';
import 'package:loginwithbloc/pages/home_page.dart';
import 'package:loginwithbloc/pages/login_page.dart';
import 'package:loginwithbloc/pages/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginwithbloc/repositories/user_repository.dart';
import 'package:loginwithbloc/states/authentication_state.dart';

void main() {
  runApp(MyApp());
  //Login must have: username, password, => you must save it to your local repository
  //or in your Database, so let's create UserRepository
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final _userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login with Bloc',
      home: BlocProvider<AuthenticationBloc>(
        create: (context) {
          final authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
          authenticationBloc.add(AuthenticationEventStarted());
          return authenticationBloc;
        },
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if(state is AuthenticationStateSuccess) {
              //show HomePage
              return HomePage();
            } else if(state is AuthenticationStateFailed) {
              //show LoginPage
              return LoginPage(userRepository: _userRepository);
            } else if(state is AuthenticationStateInProgress) {
              //show LoadingPage
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Splash();
          },
        ),
      ),
    );
  }
}

