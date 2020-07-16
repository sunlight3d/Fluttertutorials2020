
import 'package:firebaseLogin/blocs/authentication_bloc.dart';
import 'package:firebaseLogin/blocs/register_bloc.dart';
import 'package:firebaseLogin/events/authentication_event.dart';
import 'package:firebaseLogin/events/register_event.dart';
import 'package:firebaseLogin/repositories/user_repository.dart';
import 'package:firebaseLogin/states/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'buttons/register_button.dart';

class RegisterPage extends StatefulWidget {
  final UserRepository _userRepository;
  RegisterPage({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  UserRepository get _userRepository => widget._userRepository;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  RegisterBloc _registerBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isValidForm && isPopulated && !state.isSubmitting;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(userRepository: _userRepository),
          child: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state.isSubmitting) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Registering...'),
                          CircularProgressIndicator(),
                        ],
                      ),
                    ),
                  );
              }
              if (state.isSuccess) {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(AuthenticationEventLoggedIn());
                Navigator.of(context).pop();
              }
              if (state.isFailure) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Registration Failure'),
                          Icon(Icons.error),
                        ],
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
              }
            },
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    child: ListView(
                      children: <Widget>[
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            labelText: 'Email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          autovalidate: true,
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
                          autocorrect: false,
                          autovalidate: true,
                          validator: (_) {
                            return !state.isValidPassword ? 'Invalid Password' : null;
                          },
                        ),
                        RegisterButton(
                          onPressed: () {
                            if(isRegisterButtonEnabled(state)) {
                              _registerBloc.add(
                                RegisterEventPressed(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            }
                          }
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}