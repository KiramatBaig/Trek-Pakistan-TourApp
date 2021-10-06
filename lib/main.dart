import 'package:flutter/material.dart';
import 'package:flutter_auth/Bussiness%20Portal/BussinessHomeScreen.dart';
import 'package:flutter_auth/Components/loading.dart';
import 'package:flutter_auth/Screens/SignUp/google_sign_in_provider.dart';
import 'package:provider/provider.dart';
import 'Constants.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp= Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  => ChangeNotifierProvider(
  create: (context)=>GoogleSignInProvider(),
    child: MaterialApp(
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
            return BusinessHomeScreen();
          }else{
            return Loading();
          }
        },
      ),
    )
  );

}

