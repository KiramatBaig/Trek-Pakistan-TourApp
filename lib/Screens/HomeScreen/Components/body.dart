


import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/rectangular_button.dart';
import 'package:flutter_auth/Constants.dart';
import 'package:flutter_auth/Screens/Destination/home_screen.dart';
import 'package:flutter_auth/Screens/NearbyRestaurants/Restaurants.dart';
import 'package:flutter_auth/Screens/Profile_Edit/edit_profile.dart';
import 'package:flutter_auth/Screens/Services/services_screen.dart';
import 'package:flutter_auth/Screens/Weather/Weather_Screen.dart';


class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Size size=MediaQuery.of(context).size;
    return Scaffold(


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

          GridView.count(
            padding: EdgeInsets.only(left: 50,right: 50,top: 100),
            crossAxisCount: 1,
            mainAxisSpacing: 15,
            childAspectRatio: 3,
            crossAxisSpacing: 15,
            children: <Widget>[

              RectangluarButton(color: Colors.orange.withOpacity(0.8),press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ServicesScreen();
                    },
                  ),
                );
              },text: "Services",icon: Icon(Icons.business_center,color: Colors.white,),),
              RectangluarButton(color: Colors.red.withOpacity(0.8),press: (){

              },text: "Nearby Attractions",icon: Icon(Icons.near_me_rounded,color: Colors.white,),),
              RectangluarButton(color: Colors.blue.withOpacity(0.8),press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Restaurant();
                    },
                  ),
                );
              },text: "Nearby Restaurants",icon: Icon(Icons.restaurant,color: Colors.white,),),
              RectangluarButton(color: kPrimaryColor.withOpacity(0.8),
                press: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Weather();
                      },
                    ),
                  );

                },
                text: "View Weather",icon: Icon(Icons.wb_cloudy_sharp,color: Colors.white,),),

            ],
          ),



        ],


      ),


    );

  }


}


