import 'package:flutter/material.dart';
import 'package:flutter_auth/Constants.dart';

class register_as_business_partner extends StatelessWidget {
  final Function press;
  const register_as_business_partner({
    Key key, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Want to promote your business?",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "Register Here",
            style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}


