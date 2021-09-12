import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.withOpacity(0.5),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 5.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info, color: Colors.white,),
              SizedBox(width: 5.0,),
              Text("About Us",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)
            ],
          ),
          SizedBox(height: 10.0,),
          Container(
            alignment: Alignment.center,
            child: Text("Trek Pakistan is an application",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        ],
      )

    );
  }
}