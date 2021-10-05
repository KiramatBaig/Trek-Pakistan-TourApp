

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/drawer.dart';
import 'package:flutter_auth/Models/user_model.dart';
import 'package:flutter_auth/Screens/HomeScreen/home_screen.dart';
import 'package:flutter_auth/Screens/Information%20Screen/AboutUs.dart';
import 'package:flutter_auth/Screens/Profile_Edit/edit_profile.dart';




class MyNavigationBar extends StatefulWidget {
  MyNavigationBar ({Key key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {


  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    HomeScreen(),
    OnBoardingPage(),

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
          titleSpacing: 50,
          backgroundColor: Colors.green,
      ),
      drawerScrimColor: Colors.transparent,
      drawer: FrostedDrawer(),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(

                icon: Icon(Icons.home),
                title: Text('Home',),

                backgroundColor: Colors.green
            ),


            BottomNavigationBarItem(
                icon: Icon(Icons.info_outline),
                title: Text('About Us'),
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

