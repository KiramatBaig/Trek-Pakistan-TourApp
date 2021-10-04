import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/loading.dart';
import 'package:flutter_auth/Components/rounded_button.dart';
import 'package:flutter_auth/Screens/Destination/destinationDBService.dart';
import 'package:flutter_auth/Screens/HotelBooking/HotelScreen.dart';
import 'package:flutter_auth/Screens/HotelBooking/Hotel_Book.dart';
import 'package:flutter_auth/Screens/TourGuide/tourguideDetail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class TourGuideList extends StatefulWidget {
  @override
  _TourGuideListState createState() => _TourGuideListState();
}

class _TourGuideListState extends State<TourGuideList> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Trek Pakistan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          centerTitle: true,
          elevation: 4,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),

        body: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              width: double.infinity,
              child: Stack(

                children: [
                  ///Container for welcoming text
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "TOUR GUIDE",
                          style: GoogleFonts.playfairDisplay(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 36),
                        )
                      ],//children
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
              indent: 20,
              endIndent: 20,
            ),

            ///vertical spacing
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('TourGuide').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> querySnapshot){
                    if(querySnapshot.hasError){
                      return(Text("An error has occured"));
                    }
                    if(querySnapshot.connectionState==ConnectionState.waiting){
                      return Loading();
                    }else{
                      final list=querySnapshot.data.docs;
                      return ListView.builder(
                        itemCount: list.length,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        //shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,index){
                          return  Padding(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 10),

                            child: Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white70, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: Container(
                                padding: EdgeInsets.only(left: 10,top: 0,right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),

                                ),
                                child: ExpansionTile(

                                  tilePadding: EdgeInsets.only(left: 10,right: 10),
                                  leading: Text(
                                    list[index]['name'],textAlign: TextAlign.justify,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                                  ),
                                  title: Text(
                                    list[index]['location'],
                                    style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black),textAlign: TextAlign.start,
                                  ),

                                  childrenPadding: EdgeInsets.only(left: 20,right: 20),
                                  children: [
                                    Column(
                                        children:[
                                          ListTile(
                                            title: Text(
                                              list[index]['detail'],
                                              style: TextStyle(fontWeight: FontWeight.w300,),textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            child: ListTile(
                                            title: RatingBar.builder(
                                              ignoreGestures: true,
                                              initialRating: double.parse(list[index]['rating']),
                                              itemSize: 15,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber,


                                              ),


                                            ),

                                            ),


                                          ),
                                          SizedBox(height: 5,),
                                          RoundedButton(press: (){

                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>tourguideDetailsPage(list[index]['name'])));
                                          },text: "Select",),
                                        ]
                                    )
                                  ],

                                ),
                              ),
                            ),


                          );
                        },
                      );
                    }
                  },
                ))

          ],
        )
    );
  }
}
