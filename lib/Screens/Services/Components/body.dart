


import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/MyNavigationBar.dart';
import 'package:flutter_auth/Components/drawer.dart';
import 'package:flutter_auth/Components/rectangular_button.dart';
import 'package:flutter_auth/Constants.dart';
import 'package:flutter_auth/Screens/HotelBooking/Hotel_Book.dart';
import 'package:flutter_auth/Screens/MapsScreen/mapView.dart';
import 'package:flutter_auth/Screens/Weather/Weather_Screen.dart';


class Body extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        title: const Text('Trek Pakistan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        titleSpacing: 50,
        actions: [
          IconButton(icon: Icon(Icons.home,color: Colors.white,size: 30,), onPressed: (){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                MyNavigationBar()), (Route<dynamic> route) => false);
          }),
        ],

        backgroundColor: Colors.green,
      ),
      drawerScrimColor: Colors.transparent,
      drawer: FrostedDrawer(),


      body: Stack(

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
            padding: EdgeInsets.only(left: 10,right: 10,top: 200),
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            childAspectRatio: 2,
            crossAxisSpacing: 15,
            children: <Widget>[

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
                text: "Weather",icon: Icon(Icons.wb_cloudy_sharp,color: Colors.white,),),

              RectangluarButton(color: Colors.orange.withOpacity(0.8),press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MapView();
                    },
                  ),
                );
              },text: "Find route",icon: Icon(Icons.alt_route,color: Colors.white,),),
              RectangluarButton(color: Colors.red.withOpacity(0.8),press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HotelBookingPage();
                    },
                  ),
                );
              },text: "View Hotels",icon: Icon(Icons.hotel,color: Colors.white,),),
              RectangluarButton(color: Colors.blue.withOpacity(0.8),press: (){},text: "Restaurants",icon: Icon(Icons.restaurant,color: Colors.white,),),
            ],
          ),




        ],


      ),


    );

  }


}


