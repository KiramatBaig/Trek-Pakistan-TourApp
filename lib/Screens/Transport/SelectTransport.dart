
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/MyNavigationBar.dart';
import 'package:flutter_auth/Screens/Destination/Global/app_colors.dart';
import 'package:flutter_auth/Screens/Transport/TransportScreen2.dart';
import 'package:google_fonts/google_fonts.dart';

class Transport extends StatefulWidget{
  @override
  _TransportState createState() => _TransportState ();

}
class _TransportState extends State<Transport>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        title: const Text('Trek Pakistan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        titleSpacing: 50,

        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Text("Pick Transportation", textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: AppColors.darkTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),


            ],
          ),
          Divider(color: Colors.black,height: 20,),
          SizedBox(height: 40,),
          
          Container(
            color: Colors.green.withOpacity(0.3),
            child: Row(

              children: [
                SizedBox(width: 20.0,),
                ImageIcon(AssetImage("assets/icons/public-transport.png")),
                SizedBox(width: 5.0,),
                Text("Bilal Travels",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                SizedBox(width: 120.0,),
                TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>Transport2() ));
                }, child: Text(
                    "Book Ticket", style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            color: Colors.green.withOpacity(0.3),
            child: Row(

              children: [
                SizedBox(width: 20.0,),
                ImageIcon(AssetImage("assets/icons/public-transport.png")),
                SizedBox(width: 5.0,),
                Text("Road Master",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                SizedBox(width: 120.0,),
                TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>Transport2() ));
                }, child: Text(
                  "Book Ticket", style: TextStyle(color: Colors.white),
                ),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}