

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/MyNavigationBar.dart';
import 'package:flutter_auth/Components/loading.dart';
import 'package:flutter_auth/Models/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';



class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user= FirebaseAuth.instance.currentUser;
  UserModel loggedInUser=UserModel();
  TextEditingController updatednameEditingController= new TextEditingController();
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Profile"),
                titleSpacing: 100,
                backgroundColor: Colors.green,
                elevation: 1,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyNavigationBar();
                        },
                      ),
                    );
                  },
                ),
              ),
              body: Container(
                padding: EdgeInsets.only(left: 16, top: 25, right: 16),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView(
                    children: [
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4,
                                      color: Theme
                                          .of(context)
                                          .scaffoldBackgroundColor),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.1),
                                        offset: Offset(0, 10))
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        user.photoURL,
                                      ))),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Theme
                                          .of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    color: Colors.green,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Fluttertoast.showToast(
                                          msg: "Editing Picture Code");
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      TextField(
                        autofocus: false,
                        controller: updatednameEditingController,
                        keyboardType: TextInputType.name,
                        onSubmitted: (value){
                          updatednameEditingController.text=value;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_rounded),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: user.displayName,

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )

                        ),

                      ),

                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlineButton(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyNavigationBar()));
                            },
                            child: Text("CANCEL",
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 2.2,
                                    color: Colors.black)),
                          ),
                          RaisedButton(
                            onPressed: () {
                              try{
                                if(updatednameEditingController.text.isEmpty){
                                  Fluttertoast.showToast(msg: "Cannot Update Empty Name");
                                }
                                else{
                                  FirebaseAuth.instance.currentUser.updateDisplayName(updatednameEditingController.text);
                                  FirebaseFirestore.instance.collection('users').doc(user.uid).update(
                                      {'Name':updatednameEditingController.text});
                                  Fluttertoast.showToast(msg: "Update Successful");
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                      MyNavigationBar()), (Route<dynamic> route) => false);

                                }
                              }catch(e){

                              }
                            },

                            color: Colors.green,
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "SAVE",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
  }




