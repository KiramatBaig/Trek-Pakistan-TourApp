import 'package:flutter/material.dart';
import 'package:flutter_auth/Admin%20Portal/AdminScreens/AddDestination.dart';
import 'package:flutter_auth/Bussiness Portal/BussinessHomeScreen.dart';
import 'package:flutter_auth/maps/Screens/Home_Screen.dart';
import 'Constants.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp= Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TrekPakistan',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context,snapshot){
          if(snapshot.hasError){
            print('You have an error! ${snapshot.error.toString()}');
            return Text("Something went wrong!");
          }else if(snapshot.hasData ){
            return HomeScreen();
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

