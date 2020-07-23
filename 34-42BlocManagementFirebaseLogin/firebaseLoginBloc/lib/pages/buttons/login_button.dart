
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  VoidCallback _onPressed;
  LoginButton({Key key, VoidCallback onPressed}):
      _onPressed = onPressed,
      super(key: key);
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 45,
      child: RaisedButton(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        onPressed: _onPressed,
        child: Text('Login to your account', style: TextStyle(color: Colors.white, fontSize: 16),),
      ),
    );
  }
}