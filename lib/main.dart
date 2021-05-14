import 'package:flutter/material.dart';

import 'Constants.dart';

//import 'package:flutter_auth/Components/Location_Error.dart';
//import 'package:flutter_auth/Screens/Weather/Weather_Screen.dart';

import 'Screens/Welcome/welcome_screen.dart';
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
      home: WelcomeScreen(),
    );
  }
}

