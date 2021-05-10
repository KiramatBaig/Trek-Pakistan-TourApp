import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/already_have_an_account_check.dart';
import 'package:flutter_auth/Components/register_as_business_partner.dart';
import 'package:flutter_auth/Components/rounded_button.dart';
import 'package:flutter_auth/Components/rounded_icon_button.dart';
import 'package:flutter_auth/Components/rounded_input_field.dart';
import 'package:flutter_auth/Components/rounded_password_field.dart';
import 'package:flutter_auth/Screens/Login/Components/background.dart';



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
          Text("LOGIN",style: TextStyle(fontFamily: "Times New Roman",fontWeight: FontWeight.bold,fontSize: 25.0),),
          Image.asset("assets/images/enter.png",height: size.height*0.2,),
          RoundedInputField(hintText: "Your Email",
          onChanged:(value){} ,
          ),
          RoundedPasswordField(
            onChanged: (value){},

          ),
          RoundedButton(
            text: "Login",
            press: (){},
          ),

          RoundedIconButton(
            text: "Login with Facebook",
          ),

          SizedBox(height: 10.0,),
          AlreadyHaveAnAccountCheck(
            press: (){},
          ),
          SizedBox(height: 10.0,),
          register_as_business_partner(
            press: (){},
          ),

        ],
      ),
    );
  }
}

