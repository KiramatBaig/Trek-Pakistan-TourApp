import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/Components/already_have_an_account_check.dart';
import 'package:flutter_auth/Components/rounded_button.dart';
import 'package:flutter_auth/Components/verify.dart';
import 'package:flutter_auth/Models/user_model.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/SignUp/google_sign_in_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';



class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState()=>_BodyState();

}
  class _BodyState extends State<Body>{
    final auth= FirebaseAuth.instance;
  //our form key
    final _formKey=GlobalKey<FormState>();
    //editing controllers
    final firstNameEditingController=new TextEditingController();

    final emailEditingController=new TextEditingController();
    final passwordEditingController=new TextEditingController();
    final confirmpasswordEditingController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    //firstNameField
    final firstNameField= TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        if(value.isEmpty){
          return ("First name cannot be empty");
        }
        return null;
      },
      onSaved: (value){
        firstNameEditingController.text=value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Full Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )

      ),
    );

    //emailField
    final emailField= TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value){
        emailEditingController.text=value;
      },
      textInputAction: TextInputAction.next,
      validator: (value){
        if(value.isEmpty){
          return ("Please Enter Your Email");
        }
        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
          return ("Please enter a valid email address");
        }
        return null;
      },

      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )

      ),
    );

    //passwordField
    final passwordField= TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      onSaved: (value){
        passwordEditingController.text=value;
      },
      textInputAction: TextInputAction.next,
      validator: (value){
        RegExp regex=new RegExp(r'^.{6,}$');
        if(value.isEmpty){
          return ("Password is required for Login");
        }
        if(!regex.hasMatch(value)){
          return ("Password should be atleast 6 characters");
        }
      },
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )

      ),
    );
    //confirmPassword
    final confirmpasswordField= TextFormField(
      autofocus: false,
      controller: confirmpasswordEditingController,
      obscureText: true,
      onSaved: (value){
        confirmpasswordEditingController.text=value;
      },
      textInputAction: TextInputAction.done,
      validator: (value){
        if(confirmpasswordEditingController.text!=passwordEditingController.text ){
          return "Password not matched";
        }
        return null;

      },
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )

      ),
    );
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding:const EdgeInsets.only(top: 25,right: 35,left: 35, bottom: 25),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Sign Up",style: TextStyle(fontFamily: "Times New Roman",fontWeight: FontWeight.bold,fontSize: 25.0),),
                    SizedBox(
                      height: 100,
                      child: Image.asset("assets/images/add-user.png",height: size.height*0.1,fit: BoxFit.contain,),
                    ),
                    SizedBox(height: 35,),
                    firstNameField,

                    SizedBox(height: 15,),
                    emailField,
                    SizedBox(height: 15,),
                    passwordField,

                    SizedBox(height: 15,),
                    confirmpasswordField,
                    SizedBox(height: 15,),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      press: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                    ),
                    RoundedButton(text: "Sign Up",press: (){
                      signUp(emailEditingController.text, passwordEditingController.text);
                    },),



                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async{
      if(_formKey.currentState.validate()){
        await auth.createUserWithEmailAndPassword(email: emailEditingController.text, password: passwordEditingController.text).then((_){
          postDetailsToFirestore();
        }).catchError((e){
          Fluttertoast.showToast(msg: "A user with this email already exists");
        });
      }
  }



  postDetailsToFirestore() async{
    //calling our firestore
    //calling our userModel
    //sending these values

    FirebaseFirestore firebaseFirestore= FirebaseFirestore.instance;
    User user=auth.currentUser;

    UserModel userModel=UserModel();

    //writing all the values
    userModel.email=user.email;
    userModel.uid=user.uid;
    userModel.FullName=firstNameEditingController.text;
    userModel.Image="https://cdn-icons-png.flaticon.com/128/3135/3135715.png";


    await firebaseFirestore
    .collection("users")
    .doc(user.uid)
    .set(userModel.toMap());


    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VerifyScreen()));
  }
}
