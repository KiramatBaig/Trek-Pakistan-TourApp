import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Models/tourguideModel.dart';
import 'package:flutter_auth/Screens/TourGuide/TourGuideHome.dart';
import 'package:flutter_auth/Screens/TourGuide/tourguideDBService.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class tourguideDetailsPage extends StatefulWidget {
  final String name;
  tourguideDetailsPage(this.name);
  @override
  _tourguideDetailsPageState createState() => _tourguideDetailsPageState();
}


class _tourguideDetailsPageState extends State<tourguideDetailsPage> {


  tourguideModel TourGuide= tourguideModel();


  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body: FutureBuilder<QuerySnapshot>(



        future: FirebaseFirestore.instance.collection('TourGuide').where('name',isLessThanOrEqualTo: widget.name).get().then((value) {
          value.docs.forEach((element) {
            this.TourGuide = tourguideModel.fromMap(element.data());
          });
        }),
        builder: (context, snap){
          if(snap.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            print(tourguideDBService().gettourguideList().toString());
            print('i am${widget.name} hello');
            print('i am${TourGuide.destinationName.toString()} hello');
            return Stack(
              children: <Widget>[
                Container(
                    foregroundDecoration: BoxDecoration(
                        color: Colors.black26
                    ),
                    height: 400,
                    child: Image.network(TourGuide.image, fit: BoxFit.cover)
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16.0,bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 250),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:16.0),
                        child: Text(
                          "${TourGuide.name}",
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
                                      RatingBar.builder(
                                        ignoreGestures: true,
                                        allowHalfRating: true,
                                        initialRating: double.parse(TourGuide.rating),
                                        itemSize: 15,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,

                                        ),
                                      ),

                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.location_on, size: 16.0, color: Colors.grey,)
                                        ),
                                        TextSpan(
                                            text: TourGuide.destinationName
                                        )
                                      ]), style: TextStyle(color: Colors.green, fontSize: 20.0),)
                                    ],
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text("\Rs. ${TourGuide.fee}", style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0
                                    ),),
                                    Text("/per trip",style: TextStyle(
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
                              TourGuide.detail, textAlign: TextAlign.justify, style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14.0
                            ),),
                            const SizedBox(height: 10.0),

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
                    title: Text("TourGuide Detail",style: TextStyle(
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