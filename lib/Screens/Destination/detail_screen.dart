import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/rectangular_button.dart';
import 'package:flutter_auth/Models/destinations_model.dart';
import 'package:flutter_auth/Screens/HotelBooking/HotelScreen.dart';
import 'package:flutter_auth/Screens/TourGuide/TourGuideHome.dart';
import 'package:flutter_auth/Screens/Transport/SelectTransport.dart';


class DestinationDetailsPage extends StatefulWidget {
  final String name;
  DestinationDetailsPage(this.name);
  @override
  _DestinationDetailsPageState createState() => _DestinationDetailsPageState();
}


class _DestinationDetailsPageState extends State<DestinationDetailsPage> {


  DestinationModel destination= DestinationModel();


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('destinations').where('name',isEqualTo: widget.name).get(),
        builder: (context, snap){
          if(snap.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            final list=snap.data.docs;
            return Stack(
              children: <Widget>[
                Container(
                    foregroundDecoration: BoxDecoration(
                        color: Colors.black26
                    ),
                    height: 400,
                    width: 400,
                    child: Image.network(list[0]['Image'], fit: BoxFit.cover)),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16.0,bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 250),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:16.0),
                        child: Text(
                          "${list[0]['name']}",
                          style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10,),

                      Container(
                        padding: const EdgeInsets.all(32.0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[

                            SizedBox(
                              width: double.infinity,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                color: Colors.green,
                                textColor: Colors.white,
                                child: Text("Select Destination", style: TextStyle(
                                    fontWeight: FontWeight.normal
                                ),),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 32.0,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Transport(widget.name)));
                                },
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Text("Rating".toUpperCase(), style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0
                            ),),
                            const SizedBox(height: 10.0),
                            Text(
                              list[0]['rating'].toString(), textAlign: TextAlign.justify, style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14.0
                            ),),
                            const SizedBox(height: 30.0),
                            Text("Description".toUpperCase(), style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0
                            ),),
                            const SizedBox(height: 10.0),
                            Text(
                              list[0]['description'], textAlign: TextAlign.justify, style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14.0
                            ),),
                            const SizedBox(height: 15.0),
                            Text("To-do",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            Divider(
                              color: Colors.black,
                              thickness: 1.0,
                              height: 1,


                            ),
                            SafeArea(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:5.0),
                                    child: Row(

                                      children: [

                                        RectangluarButton(color: Colors.amber.withOpacity(0.7),icon: Icon(Icons.hotel),press: (){
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Hotels(widget.name)));
                                        },text: "Hotel",),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: RectangluarButton(color: Colors.red.withOpacity(0.7),icon: Icon(Icons.alt_route),press: (){},text: "Route",),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:10.0),
                                    child: Row(

                                      children: [
                                        RectangluarButton(color: Colors.teal.withOpacity(0.7),icon: Icon(Icons.person_rounded),press: (){
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TourGuideList(widget.name)));
                                        },text: "Tour Guide",),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: RectangluarButton(color: Colors.grey.withOpacity(0.7),icon: Icon(Icons.reviews),press: (){},text: "Reviews",),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,


                  ),
                ),
              ],
            );
          }
        },

      ),
    );
  }
}