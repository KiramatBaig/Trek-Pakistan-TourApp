import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/rectangular_button.dart';
import 'package:flutter_auth/Constants.dart';
import 'package:flutter_auth/Screens/NearbyRestaurants/TravelAdvisory.dart';
import '../../NearbyRestaurants/Attractions.dart';
import 'package:flutter_auth/Screens/NearbyRestaurants/Restaurants.dart';
import 'package:flutter_auth/Screens/Services/services_screen.dart';
import 'package:flutter_auth/Screens/Weather/OpenWeatherScreen.dart';



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
            padding: EdgeInsets.only(left: 50,right: 50,top: 150),
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

              RectangluarButton(color: Colors.blue.withOpacity(0.8),press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NearbyAttractionsandRestaurants();
                    },
                  ),
                );
              },text: "Travel Advisory",icon: Icon(Icons.book,color: Colors.white,),),
              RectangluarButton(color: kPrimaryColor.withOpacity(0.8),
                press: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WeatherScreen();
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


