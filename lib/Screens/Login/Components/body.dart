import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Admin%20Portal/AdminScreens/AdminHomeScreen.dart';
import 'package:flutter_auth/Components/MyNavigationBar.dart';
import 'package:flutter_auth/Components/already_have_an_account_check.dart';
import 'package:flutter_auth/Components/register_as_business_partner.dart';
import 'package:flutter_auth/Components/rounded_button.dart';
import 'package:flutter_auth/Components/rounded_input_field.dart';
import 'package:flutter_auth/Components/rounded_password_field.dart';
import 'package:flutter_auth/Components/background.dart';
import 'package:flutter_auth/Components/verify.dart';
import 'package:flutter_auth/Screens/SignUp/signup_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Constants.dart';

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
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("LOGIN",style: TextStyle(fontFamily: "Times New Roman",fontWeight: FontWeight.bold,fontSize: 25.0),),
                  Image.asset("assets/images/enter.png",height: size.height*0.1,),
                  SizedBox(height: size.height*0.04,),
                  Padding(padding: EdgeInsets.only(left: 25,right: 25),

                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,

                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value){
                        setState(() {
                          _email=value.trim();
                        });
                      },
                      validator: (value){
                        if(value.isEmpty){
                          return ("Please Enter Your Email");
                        }
                        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                          return ("Please enter a valid email address");
                        }
                        return null;
                      },

                    ),
                  ),
                  SizedBox(height: size.height*0.03,),
                  Padding(padding: EdgeInsets.only(left: 25,right: 25),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
                        prefixIcon: Icon(Icons.vpn_key),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value){
                        setState(() {
                          _password=value.trim();
                        });
                      },
                      validator: (value){
                        RegExp regex=new RegExp(r'^.{6,}$');
                        if(value.isEmpty){
                          return ("Password is required for Login");
                        }
                        if(!regex.hasMatch(value)){
                          return ("Password should be atleast 6 characters");
                        }
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
                          signIn(_email, _password);

                        },
                      ),

                    ],
                  ),
                  SizedBox(height: 5.0,),
                  IconButton(icon: Icon(FontAwesomeIcons.google,color: Colors.red,), onPressed: (){

                  }),
                  SizedBox(height: 5.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not Regestered? ",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignUpScreen()));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  register_as_business_partner(
                    press: (){},
                  ),
                  SizedBox(height: 5.0,),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          HomeScreen()), (Route<dynamic> route) => false);
                    },
                    child: Text(
                      "Admin",
                      style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void signIn(String email,String password)async{
    if(_formKey.currentState.validate()){
      await auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
        Fluttertoast.showToast(msg: "Login Successful");
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyNavigationBar()));
      }).catchError((e){
        Fluttertoast.showToast(msg: "Invalid Email or Password");
      }) ;
    }
  }
}

