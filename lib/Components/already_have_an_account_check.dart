import 'package:flutter/material.dart';
import 'package:flutter_auth/Constants.dart';
class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key, this.login=true, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login? "Don't have an account?":"Already have an account?",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login? "SignUp":"Sign In",
            style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}

