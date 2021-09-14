


import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/drawer.dart';
import 'package:flutter_auth/Components/rectangular_button.dart';
import 'package:flutter_auth/Screens/Destination/home_screen.dart';
import 'package:flutter_auth/Screens/MapsScreen/MapView2.dart';
import 'package:flutter_auth/Screens/Pre-PlannedTrips/PrePlannedTrips.dart';


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
            Navigator.pop(context);}),
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
            padding: EdgeInsets.only(left: 50,right: 50,top: 100,bottom: 100),
            crossAxisCount: 1,
            mainAxisSpacing: 20,
            childAspectRatio: 3,
            crossAxisSpacing: 20,
            children: <Widget>[



              RectangluarButton(color: Colors.orange.withOpacity(0.8),press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MapView2();
                    },
                  ),
                );
              },text: "Track route",icon: Icon(Icons.alt_route,color: Colors.white,),),
              RectangluarButton(color: Colors.limeAccent.withOpacity(0.5),press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),
                );
              },text: "Plan a Trip",icon: Icon(Icons.airport_shuttle_outlined,color: Colors.white,),),
              RectangluarButton(color: Colors.teal.withOpacity(0.8),press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PrePlannedTrip();
                    },
                  ),
                );
              },text: "Planned Trips",icon: Icon(Icons.assignment_rounded,color: Colors.white,),),
              RectangluarButton(color: Colors.deepOrangeAccent.withOpacity(0.8),press: (){

              },text: "Trekking",icon: Icon(Icons.directions_walk,color: Colors.white,),),
              RectangluarButton(color: Colors.amber.withOpacity(0.8),press: (){

              },text: "Auto Tour",icon: Icon(Icons.settings_applications,color: Colors.white,),),
            ],
          ),




        ],


      ),


    );

  }


}


