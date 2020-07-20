
import 'package:firebaseLoginBloc/blocs/register_bloc.dart';
import 'package:firebaseLoginBloc/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../register_page.dart';

class RegisterUserButton extends StatelessWidget {
  final UserRepository _userRepository;

  RegisterUserButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 45,
      child: FlatButton(
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
        color: Colors.green,
        child: Text(
          'Register a new Account',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return BlocProvider<RegisterBloc>(
                  create: (context) => RegisterBloc(userRepository: _userRepository),
                  child: RegisterPage(userRepository: _userRepository)
              );
            }),
          );
        },
      ),
    );
  }
}