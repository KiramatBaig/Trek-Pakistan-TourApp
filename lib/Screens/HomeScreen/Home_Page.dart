import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_auth/Components/rectangular_button.dart';
import 'package:flutter_auth/Constants.dart';
import 'package:flutter_auth/Screens/NearbyRestaurants/TravelAdvisory.dart';

import 'package:flutter_auth/Screens/NearbyRestaurants/Restaurants.dart';
import 'package:flutter_auth/Screens/Services/services_screen.dart';
import 'package:flutter_auth/Screens/Weather/OpenWeatherScreen.dart';



class HomePage extends StatelessWidget{
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
                    image: AssetImage("assets/images/homebackground.jpg"),
                  )
              ),
            ),
          ),

              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ServicesScreen();
                                  },
                                ),
                              );
                            },
                            child: Container(

                              height: 330,
                              width: 105,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(

                                  children: [
                                    Text("Services",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),textAlign: TextAlign.center,),
                                    Icon(Icons.business_center,color: Colors.white,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 70,left: 3,right: 3),
                                      child: Text("We provide you with different services to give you the best experience",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.white,),textAlign: TextAlign.center),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.teal.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(10),

                              )
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return NearbyAttractionsandRestaurants();
                                  },
                                ),
                              );
                            },
                            child: Container(
                                height: 300,
                                width: 105,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      Text("Travel Advisory",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),textAlign: TextAlign.center,),
                                      Icon(Icons.book,color: Colors.white,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 30,left: 3,right: 3),
                                        child: Text("Provides you with a guide about attractions and locations near you",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.white,),textAlign: TextAlign.center),
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(10),

                                )
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return WeatherScreen();
                                  },
                                ),
                              );
                            },
                            child: Container(
                                height: 270,
                                width: 105,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      Text("Weather",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),textAlign: TextAlign.center,),
                                      Icon(Icons.wb_cloudy_sharp,color: Colors.white,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 40,left: 3,right: 3),
                                        child: Text("Weather details of different locations",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.white,),textAlign: TextAlign.center),
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(10),

                                )
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              )




        ],


      ),


    );

  }


}



