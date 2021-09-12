import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/Components/Drawer.dart';
import 'package:flutter_auth/Components/MyNavigationBar.dart';
import 'package:flutter_auth/Screens/Destination/Global/app_colors.dart';
import 'package:flutter_auth/Screens/HotelBooking/Hotel_Detail.dart';

import 'package:flutter_auth/Screens/Profile_Edit/edit_profile.dart';
import 'package:flutter_auth/Screens/Transport/SelectTransport.dart';
import 'package:google_fonts/google_fonts.dart';



class Hotel {
  String imageUrl;
  String title;
  String description;
  int price;
  double rating;

  Hotel({this.description, this.imageUrl, this.price, this.rating, this.title});
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: "assets/images/room4.jpg",
    title: 'Hunza Luxus',
    description: 'A Four Start Hotel ',
    price: 180,
    rating: 4.5,
  ),
  Hotel(
    imageUrl: "assets/images/room3.jpg",
    title: 'Hotel Merriot',
    description: 'A five star Hotel in isb',
    price: 180,
    rating: 4.5,
  ),
  Hotel(
    imageUrl: "assets/images/room2.jpg",
    title: 'Serena Hotel',
    description: 'A five Star hotel in gilgit',
    price: 180,
    rating: 4.5,
  ),
  Hotel(
    imageUrl: "assets/images/room1.jpg",
    title: 'Hotel Star',
    description: 'A Five star hotel in thamel',
    price: 180,
    rating: 4.5,
  )
];

class HotelBookingPage extends StatefulWidget {
  static final String path = "lib/Screens/HotelBooking/Hotel_Book.dart";

  @override
  _HotelBookingPageState createState() => _HotelBookingPageState();
}

class _HotelBookingPageState extends State<HotelBookingPage> {
  @override
  Widget build(BuildContext context) {
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


      body: ListView(

        children: <Widget>[

          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("Book a Hotel", textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: AppColors.darkTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(width: 120.0,),
              TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>Transport() ));
              }, child:
              Text("Skip")),


            ],
          ),

          Divider(color: Colors.black,height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 50.0),
            child: Text(
              'Top Rated Hotels',
              style: GoogleFonts.poppins(
                  color: AppColors.darkTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 250,
            width: double.infinity,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  height: 80,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 140.0,
                        width: 170.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          image: DecorationImage(
                            image: AssetImage(hotels[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          hotels[index].title,
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          hotels[index].description,
                          style: TextStyle(fontSize: 13.0, color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '\$${hotels[index].price} / night',
                              style: TextStyle(color: Colors.greenAccent),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  '${hotels[index].rating}',
                                  style: TextStyle(color: Colors.greenAccent),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.greenAccent,
                                  size: 16.0,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Hotel Packages',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),

              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: <Widget>[
              _hotelPackage(0),
              SizedBox(height: 20),
              _hotelPackage(1),
              SizedBox(height: 20),
              _hotelPackage(2),
              SizedBox(height: 20),
              _hotelPackage(3),
            ],
          )
        ],
      ),
    );
  }
}

_hotelPackage(int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 4.0),
            blurRadius: 10.0,
          )
        ],
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                image: DecorationImage(
                  image: AssetImage(hotels[index].imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  hotels[index].title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  hotels[index].description,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '\$${hotels[index].price} / night',
                  style: TextStyle(fontSize: 16, color: Colors.greenAccent),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.local_bar,
                        color: Colors.greenAccent,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.wifi,
                        color: Colors.greenAccent,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 230,
            child: Center(
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15.0,
                      offset: Offset(2.0, 4.4),
                    ),
                  ],
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {

                    },
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:15,
                          color: Colors.white
                      ),
                      textAlign: TextAlign.center,),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}