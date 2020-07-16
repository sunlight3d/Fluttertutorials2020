import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback _onPress;

  LoginButton({Key key, VoidCallback onPress})
      : _onPress = onPress,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: _onPress,
      child: Text('Login to your account'),
    );
  }
}
