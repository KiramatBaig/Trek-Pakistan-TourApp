import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Admin%20Portal/AdminScreens/AdminHomeScreen.dart';
//import 'package:flutter_auth/Components/MyNavigationBar.dart';
import 'package:flutter_auth/Components/already_have_an_account_check.dart';
import 'package:flutter_auth/Components/register_as_business_partner.dart';
import 'package:flutter_auth/Components/rounded_button.dart';
import 'package:flutter_auth/Components/rounded_input_field.dart';
import 'package:flutter_auth/Components/rounded_password_field.dart';
import 'package:flutter_auth/Components/background.dart';
import 'package:flutter_auth/Screens/SignUp/signup_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Body extends StatefulWidget{
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();

}

class _BodyState extends State<Body>{
  String _email='';
  String _password='';
  final auth= FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("LOGIN",style: TextStyle(fontFamily: "Times New Roman",fontWeight: FontWeight.bold,fontSize: 25.0),),
          Image.asset("assets/images/enter.png",height: size.height*0.1,),
          SizedBox(height: size.height*0.04,),
          Padding(padding: EdgeInsets.only(left: 25,right: 25),

            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
              ),
              onChanged: (value){
                setState(() {
                  _email=value.trim();
                });
              },
            ),
          ),
          SizedBox(height: size.height*0.03,),
          Padding(padding: EdgeInsets.only(left: 25,right: 25),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password"
              ),
              onChanged: (value){
                setState(() {
                  _password=value.trim();
                });
              },
            ),
          ),
          SizedBox(height: size.height*0.03,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedButton(
                text: "Login",
                press: (){
                  auth.signInWithEmailAndPassword(email: _email, password: _password);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyNavigationBar()));
                },
              ),
              RoundedButton(
                text: "Sign Up",
                press: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        auth.createUserWithEmailAndPassword(email: _email, password: _password);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyNavigationBar()));
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 5.0,),
          IconButton(icon: Icon(FontAwesomeIcons.google,color: Colors.red,), onPressed: (){

          }),
          SizedBox(height: 5.0,),
          register_as_business_partner(
            press: (){},
          ),
          SizedBox(height: 5.0,),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  AdminHomeScreen()), (Route<dynamic> route) => false);
            },
            child: Text(
              "Admin",
              style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),
            ),
          ),

        ],
      ),
    );
  }
}

