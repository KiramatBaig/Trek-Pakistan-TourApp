import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/already_have_an_account_check.dart';
import 'package:flutter_auth/Components/register_as_business_partner.dart';
import 'package:flutter_auth/Components/rounded_button.dart';
import 'package:flutter_auth/Components/rounded_input_field.dart';
import 'package:flutter_auth/Components/rounded_password_field.dart';
import 'package:flutter_auth/Components/background.dart';
import 'package:flutter_auth/Screens/SignUp/signup_screen.dart';



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
          Image.asset("assets/images/enter.png",height: size.height*0.1,),
          SizedBox(height: size.height*0.04,),
          RoundedInputField(hintText: "Your Email",
          onChanged:(value){} ,
          ),
          RoundedPasswordField(
            onChanged: (value){},

          ),
          SizedBox(height: size.height*0.03,),
          RoundedButton(
            text: "Login",
            press: (){},
          ),


          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(height: 5.0,),
          register_as_business_partner(
            press: (){},
          ),

        ],
      ),
    );
  }
}

