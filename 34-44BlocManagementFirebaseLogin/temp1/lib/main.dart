import 'package:firebaseLogin/events/authentication_event.dart';
import 'package:firebaseLogin/pages/home_page.dart';
import 'package:firebaseLogin/pages/login_page.dart';
import 'package:firebaseLogin/pages/splash_page.dart';
import 'package:firebaseLogin/repositories/user_repository.dart';
import 'package:firebaseLogin/states/authentication_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebaseLogin/blocs/authentication_bloc.dart';

import 'blocs/login_bloc.dart';
import 'blocs/simple_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = SimpleBlocObserver();
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => AuthenticationBloc(userRepository: userRepository)..add(AuthenticationEventStarted()),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, authenticationState){
            if (authenticationState is AuthenticationStateFailure) {
              return BlocProvider<LoginBloc>(
                create: (context) => LoginBloc(userRepository: userRepository),
                child: LoginPage(userRepository: userRepository)
              );
            }else if (authenticationState is AuthenticationStateSuccess) {
              return HomePage(firebaseUser: authenticationState.firebaseUser);
            }
            return SplashPage();
          },
        ),
      )
    );
  }
}
