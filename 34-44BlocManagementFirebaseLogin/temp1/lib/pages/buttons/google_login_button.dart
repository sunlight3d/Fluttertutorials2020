import 'package:firebaseLogin/blocs/login_bloc.dart';
import 'package:firebaseLogin/events/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 45,
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        icon: Icon(FontAwesomeIcons.google, color: Colors.white, size: 17,),
        onPressed: () {
          BlocProvider.of<LoginBloc>(context).add(LoginEventWithGooglePressed());
        },
        label: Text('Signin with Google', style: TextStyle(color: Colors.white, fontSize: 16)),
        color: Colors.redAccent,
      ),
    );
  }
}
