import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginwithbloc/repositories/user_repository.dart';

class LoginPage extends StatefulWidget {
  //because it has TextField(input email, password)
  final UserRepository userRepository;
  LoginPage({this.userRepository});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPage();
  }
}
class _LoginPage extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'email'),
            controller: _emailController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'password'),
            controller: _passwordController,
          ),
          RaisedButton(
            onPressed: () {
              //add event to Bloc, but where is my "Login Bloc" ?
              //We must have LoginEvent, LoginState, LoginBloc...
            },
            child: Text('Login', style: TextStyle(fontSize: 18),),
          )
        ],
      ),
    );
  }
}