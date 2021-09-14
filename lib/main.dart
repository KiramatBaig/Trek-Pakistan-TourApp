import 'package:flutter/material.dart';
//import 'package:flutter_auth/Screens/HomeScreen/home_screen.dart';
  import 'package:flutter_auth/AdminPortal/AdminScreens/AdminHomeScreen.dart';



import 'Constants.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}

