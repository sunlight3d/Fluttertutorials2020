import 'package:firebaseLogin/blocs/authentication_bloc.dart';
import 'package:firebaseLogin/blocs/login_bloc.dart';
import 'package:firebaseLogin/events/authentication_event.dart';
import 'package:firebaseLogin/events/login_event.dart';
import 'package:firebaseLogin/repositories/user_repository.dart';
import 'package:firebaseLogin/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'buttons/google_login_button.dart';
import 'buttons/login_button.dart';
import 'buttons/register_user_button.dart';

class LoginPage extends StatefulWidget {
  final UserRepository _userRepository;

  LoginPage({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;

  UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isValidEmailAndPassword && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }
  /*
  BlocProvider<LoginBloc>(
  create: (context) => LoginBloc(userRepository: _userRepository),
  child:
  )
  */
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                  content: Text('Login Failed')
              ),
            );
        }
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('Logging In...'),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context)
              .add(AuthenticationEventLoggedIn());
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Form(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset('assets/flutter_logo.png', height: 200),
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autovalidate: true,
                      autocorrect: false,
                      validator: (_) {
                        return !state.isValidEmail ? 'Invalid Email' : null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      autovalidate: true,
                      autocorrect: false,
                      validator: (_) {
                        return !state.isValidPassword ? 'Invalid Password' : null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          LoginButton(
                            onPress: isLoginButtonEnabled(state)
                                ? _onPageSubmitted
                                : null,
                          ),
                          GoogleLoginButton(),
                          RegisterUserButton(userRepository: _userRepository),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(
      LoginEventEmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.add(
      LoginEventPasswordChanged(password: _passwordController.text),
    );
  }

  void _onPageSubmitted() {
    _loginBloc.add(
      LoginEventWithEmailAndPasswordPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}