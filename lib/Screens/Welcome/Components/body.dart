import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/rounded_button.dart';
import 'package:flutter_auth/Screens/Welcome/Components/background.dart';

import '../../../Constants.dart';
import '../../Login/login_screen.dart';


class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Size size=MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image.asset("assets/images/mountain.png",
              height: size.height*0.2,
            ),
            Text("Trek Pakistan",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,fontFamily: "Times New Roman"),
            ),
            SizedBox(height: 100.0,),
            RoundedButton(
              text: "LOGIN",
              press: (){
                Navigator.push(context,MaterialPageRoute(builder: (context){return LoginScreen();},),);},


            ),

            RoundedButton(
              text: "SIGN UP",
              press: (){},
              color: kPrimaryLightColor,
              textColor: Colors.black,


            )

          ],
        ),
      ),
    );
  }
}

