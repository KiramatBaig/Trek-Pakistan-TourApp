import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/already_have_an_account_check.dart';

import 'package:flutter_auth/Components/rounded_button.dart';

import 'package:flutter_auth/Components/rounded_input_field.dart';
import 'package:flutter_auth/Components/rounded_password_field.dart';
import 'package:flutter_auth/Components/background.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';



class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("SIGN UP",style: TextStyle(fontFamily: "Times New Roman",fontWeight: FontWeight.bold,fontSize: 25.0),),
          Image.asset("assets/images/add-user.png",height: size.height*0.1,),
          SizedBox(height: size.height*0.04,),
          RoundedInputField(hintText: "Your Name",
            onChanged:(value){} ,
          ),
          RoundedInputField(hintText: "Your Email",
            onChanged:(value){} ,
          ),
          RoundedPasswordField(
            onChanged: (value){},

          ),
          SizedBox(height: size.height*0.03,),
          RoundedButton(
            text: "Sign Up",
            press: (){},
          ),
          SizedBox(height: size.height*0.03,),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.pop(context);
            },
          ),





        ],
      ),
    );
  }
}

