

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_auth/Screens/Information%20Screen/AboutUs.dart';
import 'package:flutter_auth/Screens/NearbyRestaurants/Attractions.dart';
import 'package:flutter_auth/Screens/NearbyRestaurants/Restaurants.dart';
import 'package:flutter_auth/Screens/Profile_Edit/edit_profile.dart';




class NearbyAttractionsandRestaurants extends StatefulWidget {
  NearbyAttractionsandRestaurants ({Key key}) : super(key: key);

  @override
  _NearbyAttractionsandRestaurantsState createState() => _NearbyAttractionsandRestaurantsState();
}

class _NearbyAttractionsandRestaurantsState extends State<NearbyAttractionsandRestaurants > {


  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    NearbyRestaurants(),
    NearbyAttraction()

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        elevation: 0,

        title: const Text('Trek Pakistan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        centerTitle: true,
        backgroundColor: Colors.green,

      ),


      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(

                icon: Icon(Icons.restaurant),
                title: Text('Restaurants',),

                backgroundColor: Colors.green
            ),


            BottomNavigationBarItem(
                icon: Icon(Icons.attractions),
                title: Text('Attractions'),
                backgroundColor: Colors.green
            ),

          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}

