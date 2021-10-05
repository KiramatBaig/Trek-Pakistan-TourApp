import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/MyNavigationBar.dart';
import 'package:flutter_auth/Components/rounded_button.dart';
import 'package:flutter_auth/Components/rounded_icon_button.dart';
import 'package:flutter_auth/Models/user_model.dart';
import 'package:flutter_auth/Screens/SignUp/google_sign_in_provider.dart';
import 'package:flutter_auth/Screens/Welcome/Components/background.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

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

            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                children: [
                  Image.asset("assets/images/mountain.png",
                    height: size.height*0.2,
                  ),
                  Text("Trek Pakistan",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,fontFamily: "Times New Roman"),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Text("Explore every famous place in Pakistan and get a complete package of services including Guides, Tranport, Hotels. Get reatime directions and more...",
                style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15,fontFamily: "Times New Roman")),
            ),
            SizedBox(height: 20.0,),
            Divider(color: Colors.green,height: 10,thickness: 2,indent: 30,endIndent: 30,),
            SizedBox(height: 50.0,),
            RoundedIconButton(
                onTap:(){
                    final provider=Provider.of<GoogleSignInProvider>(context,listen: false);
                    provider.signInWithGoogle().then((value) => {
                      Fluttertoast.showToast(msg: "Sign In Successful"),
                      postDetailsToFirestore(),
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyNavigationBar()))
                    }).catchError((e){
                      Fluttertoast.showToast(msg: "Sign In Unsuccessful");
                    });

                },
                text: "Sign in with Google",
            )
          ],
        ),
      ),
    );
  }
  postDetailsToFirestore() async{
    //calling our firestore
    //calling our userModel
    //sending these values

    FirebaseFirestore firebaseFirestore= FirebaseFirestore.instance;
    User user=FirebaseAuth.instance.currentUser;

    UserModel userModel=UserModel();

    //writing all the values
    userModel.email=user.email;
    userModel.uid=user.uid;
    userModel.FullName= user.displayName;
    userModel.Image=user.photoURL;



    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());


  }

}

