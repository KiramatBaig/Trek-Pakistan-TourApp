

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/PrePlannedTrip_Model.dart';
import 'package:flutter_auth/Payment/PaymentHome.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TripDetails extends StatefulWidget {
  final String host;
  TripDetails(this.host);
  @override
  _TripDetailsState createState() => _TripDetailsState();
}


class _TripDetailsState extends State<TripDetails> {


  PrePlannedTripModel trip= PrePlannedTripModel();


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('preplannedtrips').where('host',isEqualTo: widget.host).get().then((value) {
          value.docs.forEach((element) {
            this.trip = PrePlannedTripModel.fromMap(element.data());
            print("Mapping done");
          });
        }),
        builder: (context, snap){
          if(snap.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          else{
            return Stack(
              children: <Widget>[
                Container(
                    foregroundDecoration: BoxDecoration(
                        color: Colors.black26
                    ),
                    height: 400,
                    width: 400,
                    child: Image.network(trip.image, fit: BoxFit.cover)),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16.0,bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 250),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:16.0),
                        child: Text(
                          "${trip.host}",
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
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.location_on, size: 16.0, color: Colors.grey,)
                                        ),
                                        TextSpan(
                                            text: trip.fromLocation
                                        ),
                                        TextSpan(text:
                                            ' To ${trip.toLocation}'
                                        ),
                                      ]), style: TextStyle(color: Colors.grey, fontSize: 12.0),)
                                    ],
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text("\Rs. ${trip.priceperhead.toString()}", style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0
                                    ),),
                                    Text("/per head",style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey
                                    ),)
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 30.0),
                            SizedBox(
                              width: double.infinity,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                color: Colors.green,
                                textColor: Colors.white,
                                child: Text("Book Now", style: TextStyle(
                                    fontWeight: FontWeight.normal
                                ),),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 32.0,
                                ),
                                onPressed: () {
                                  Fluttertoast.showToast(msg: "Payment Module");
                                },
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Text("Description".toUpperCase(), style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0
                            ),),
                            const SizedBox(height: 10.0),
                            Text(
                              trip.description, style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14.0
                            ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              'Days: ${trip.days}', style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14.0
                            ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              'Pick Up: ${trip.pickupLocation}', style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0
                            ),
                            ),
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
                    centerTitle: true,
                    title: Text("Trip Detail",style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal
                    ),),
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