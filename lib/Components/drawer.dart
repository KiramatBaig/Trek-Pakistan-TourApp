import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/loading.dart';
import 'package:flutter_auth/Models/user_model.dart';
import 'package:flutter_auth/Screens/Profile_Edit/edit_profile.dart';
import 'package:flutter_auth/Screens/Profile_Edit/settings.dart';
import 'package:flutter_auth/Screens/SignUp/google_sign_in_provider.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FrostedDrawer extends StatefulWidget{
  @override
  _FrostedDrawerState createState()=>_FrostedDrawerState();

}
class _FrostedDrawerState extends State<FrostedDrawer> {
  final auth = FirebaseAuth.instance;
  User user= FirebaseAuth.instance.currentUser;
  UserModel loggedInUser=UserModel();


  @override
  Widget build(BuildContext context) {


            return Container(
              width: 300,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromARGB(180, 250, 250, 250),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(31, 38, 135, 0.4),
                      blurRadius: 8.0,
                    )
                  ],
                  border: Border(
                      right: BorderSide(
                        color: Colors.white70,
                      ))),
              child: Stack(
                children: [
                  SizedBox(
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 4.0,
                          sigmaY: 4.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.grey.withOpacity(0.0),
                                Colors.green.withOpacity(0.8),
                              ])),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      DrawerHeader(
                        child: Row(

                          children: [

                            CircleAvatar(
                              backgroundImage: NetworkImage(user.photoURL),
                              radius: 30.0,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text("${user.displayName} ",)
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text("${user.email}",style: TextStyle(fontWeight: FontWeight.bold),),
                      Expanded(
                        child: ListView(
                          children: [

                            ListTile(
                              onTap: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context){return SettingsUI();},),);

                              },
                              leading: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              title: Text("Profile"),
                            ),

                            ListTile(
                              onTap: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context){return SettingsPage();},),);
                              },
                              leading: Icon(
                                Icons.settings,
                                color: Colors.black,
                              ),
                              title: Text("Settings"),
                            ),

                            ListTile(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder:(context){
                                      return ContactUsDialog(title: "Contact Us",description: "0301594632",);
                                    }
                                );
                              },

                              leading: Icon(
                                Icons.local_phone,
                                color: Colors.black,
                              ),
                              title: Text("Contact Us"),
                            ),
                            ListTile(
                              onTap: () {
                                final provider=Provider.of<GoogleSignInProvider>(context,listen: false);
                                provider.logout().then((value) => {
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                      WelcomeScreen()), (Route<dynamic> route) => false),
                                });

                              },

                              leading: Icon(
                                Icons.logout,
                                color: Colors.black,
                              ),
                              title: Text("Log Out"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );

}
}

class ContactUsDialog extends StatefulWidget {
  final String title,description;

  ContactUsDialog({
    this.title, this.description,
  });

  @override
  State<ContactUsDialog> createState() => _ContactUsDialogState();
}

class _ContactUsDialogState extends State<ContactUsDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),

      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 100,
            left: 16,
            bottom: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 16),

          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17.0),
              boxShadow:[
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10.0,
                  offset: Offset(0.0,10.0),
                )
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(

                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,


                  ),
                ),
                onTap: (){

                },
              ),
              SizedBox(height: 16.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Telephone:",style: TextStyle(fontWeight: FontWeight.bold),),
                  InkWell(
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                        decoration: TextDecoration.underline
                      ),

                    ),
                    onTap:  () => setState(() {
                      _makePhoneCall('03015945588');
                    }),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Email:",style: TextStyle(fontWeight: FontWeight.bold),),
                  InkWell(
                    child: Text(
                      'zeshank1098@gmail.com',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                          decoration: TextDecoration.underline
                      ),

                    ),
                    onTap:  () {
                      launch('mailto:zeshank1098@gmail.com?');
                    }
                  ),
                ],
              ),
              SizedBox(height: 24.0,),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Close"),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 25,
          left: 16,
          right: 16,
          child: CircleAvatar(
            child: Icon(Icons.phone),
            radius: 30.0,


          ),
        )
      ],
    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
