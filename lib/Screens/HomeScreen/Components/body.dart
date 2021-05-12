


import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/rectangular_button.dart';
import 'package:flutter_auth/Constants.dart';


class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Trek Pakistan"),
        titleSpacing: 70.0,
        backgroundColor: kPrimaryColor,
      ),

      drawer: Drawer(

        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(

                color: kPrimaryColor,
              ),
              child: Container(
                
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),

                      child: Image.asset("assets/images/grassland.png",height: size.height*0.1,),
                    ),
                    Padding(padding: EdgeInsets.all(8.0),child: Text("Welcome",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),),

                  ],
                ),
              ),
            ),
            ListTile(
              title: Text("Profile",style: TextStyle(fontWeight: FontWeight.bold),),
              leading: Icon(Icons.account_circle_outlined),
            ),
            ListTile(
              title: Text("Notifications",style: TextStyle(fontWeight: FontWeight.bold),),
              leading: Icon(Icons.notifications),
            ),
            ListTile(
              title: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold),),
              leading: Icon(Icons.logout),

            ),
          ],
        ),
      ),
      
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/gilgit.jpg"),
                )
              ),
            ),
          ),

          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RectangluarButton(color: kPrimaryColor.withOpacity(0.8),press: (){},text: "Destinations",icon: Icon(Icons.place_outlined,color: Colors.white,),),
                SizedBox(height: 10.0,),
                RectangluarButton(color: Colors.orange.withOpacity(0.8),press: (){},text: "Nearby Attractions",icon: Icon(Icons.location_city_rounded,color: Colors.white,),),

              ],
            ),


        ],


      ),


    );

  }


}

