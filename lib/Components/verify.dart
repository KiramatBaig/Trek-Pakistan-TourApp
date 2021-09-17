import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/MyNavigationBar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VerifyScreen extends StatefulWidget{
  @override
  _VerifyScreenState createState()=> _VerifyScreenState();
}
class _VerifyScreenState extends State<VerifyScreen>{
  final auth=FirebaseAuth.instance;
  User user;
  Timer timer;
  @override
  void initState(){
    user=auth.currentUser;
    user.sendEmailVerification();
    timer=Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SimpleDialog(

          backgroundColor: Colors.green.withOpacity(0.4),
          title: Text("Verification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),

          children: [
            Padding(padding: EdgeInsets.only(left:25.0,right: 15.0),
            child: Text('A verification email has been sent to ${user.email}',style: TextStyle(fontWeight: FontWeight.bold),),),

          ],
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async{
    user=auth.currentUser;
    await user.reload();
    if(user.emailVerified){
      timer.cancel();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyNavigationBar()));
      Fluttertoast.showToast(msg: "Account created Successfully");
    }
  }
}