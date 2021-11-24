import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/loading.dart';
import 'package:flutter_auth/Components/rounded_button.dart';
import 'package:flutter_auth/Screens/Destination/destinationDBService.dart';
import 'package:flutter_auth/Screens/Destination/detail_screen.dart';
import 'package:flutter_auth/Screens/HotelBooking/HotelScreen.dart';
import 'package:flutter_auth/Screens/HotelBooking/Hotel_Book.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'Global/app_colors.dart';

class DestinationScreen extends StatefulWidget {

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Trek Pakistan',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
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
        body: SafeArea(
          child:  Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Destinations",
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    color: AppColors.darkTextColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Divider(
              color: Colors.black,
              height: 10,
              indent: 20,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Popular Places',
                style: GoogleFonts.poppins(
                    color: AppColors.darkTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('destinations')
                  .where('rating', isGreaterThanOrEqualTo: 4)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> querySnapshot) {
                if (querySnapshot.hasError) {
                  return (Text("An error has occured"));
                }
                if (querySnapshot.connectionState == ConnectionState.waiting) {
                  return Loading();
                } else {
                  final list = querySnapshot.data.docs;
                  return Container(
                    height: 250,
                    width: double.infinity,
                    child: ListView.builder(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DestinationDetailsPage(list[index]['name'])));
                            print(list[index]['name']);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            height: 100,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0.0, 4.0),
                                  blurRadius: 10.0,
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 140.0,
                                  width: 320,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(list[index]['Image']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Text(
                                    list[index]['name'],
                                    style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0, top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            '${list[index]['rating']}',
                                            style: TextStyle(
                                                color: Colors.greenAccent),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.greenAccent,
                                            size: 16.0,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Other Places',
                style: GoogleFonts.poppins(
                    color: AppColors.darkTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('destinations')
                    .where('rating', isLessThan: 4)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> querySnapshot) {
                  if (querySnapshot.hasError) {
                    return (Text("An error has occured"));
                  }
                  if (querySnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Loading();
                  } else {
                    final list = querySnapshot.data.docs;
                    return Expanded(
                      child: ListView.builder(
                          padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          scrollDirection: Axis.vertical,
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DestinationDetailsPage(list[index]['name'])));
                                print(list[index]['name']);
                                },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                                  height: 240,
                                  width: 320,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0.0, 4.0),
                                        blurRadius: 10.0,
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 140.0,
                                        width: 320,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(list[index]['Image']),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 10, top: 10),
                                        child: Text(
                                          list[index]['name'],
                                          style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0, top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  '${list[index]['rating']}',
                                                  style: TextStyle(
                                                      color: Colors.greenAccent),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.greenAccent,
                                                  size: 16.0,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                    );
                  }
                }),
          ]),
        ));
  }
}
