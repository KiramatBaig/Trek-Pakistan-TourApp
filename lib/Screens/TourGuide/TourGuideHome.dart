import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/loading.dart';
import 'package:flutter_auth/Screens/Destination/Destination_List.dart';
import 'package:flutter_auth/Screens/TourGuide/tourguideDetail.dart';
import 'package:flutter_auth/Screens/Transport/SelectTransport.dart';
import 'package:google_fonts/google_fonts.dart';

class TourGuideList extends StatefulWidget {
  final String destination;
  TourGuideList(this.destination);
  @override
  _TourGuideListState createState() => _TourGuideListState();
}

class _TourGuideListState extends State<TourGuideList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'TREK PAKISTAN',
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              width: double.infinity,
              child: Stack(
                children: [
                  ///Container for welcoming text
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [

                            Text(
                              "TOUR GUIDE",
                              style: GoogleFonts.playfairDisplay(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36),
                            ),
                            TextButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Transport(widget.destination)));
                            }, child: Text("Skip")),
                        Divider(color: Colors.black, height: 10,),

                      ], //children
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('TourGuide').where('location',isEqualTo:widget.destination )
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> querySnapshot) {
                    if (querySnapshot.hasError) {
                      return (Text("An error has occured"));
                    }
                    else if (querySnapshot.connectionState == ConnectionState.waiting) {
                      return Loading();
                    }
                    else if (querySnapshot.data.docs.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.all(30),
                        child: Center(
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.green.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.error_outline),
                                      Text("We are sorry",style: TextStyle(fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Text("No Guides available for this location"),
                                  TextButton(onPressed: (){
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) =>DestinationList() ));
                                  }, child: Text("Choose another location"))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    else {
                      final list = querySnapshot.data.docs;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 140,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                            ),
                            child: InkWell(
                              onTap: () async {
                                print("hello");
                              },
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    // await Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         ArtPiecePageWidget(
                                    //           artPiece:
                                    //           containerGetArtPieceResponse,
                                    //         ),
                                    //   ),
                                    // );
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 5, 10, 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Image.network(
                                            list[index]['image'],
                                            width: 90,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      list[index]['name'],
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'Playfair Display',
                                                        fontSize: 26,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional
                                                          .fromSTEB(0, 3, 0, 6),
                                                      child: Row(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: AutoSizeText(
                                                              list[index]['detail'],
                                                              style: TextStyle(
                                                                fontFamily:
                                                                'Playfair Display',
                                                                color: Colors.grey,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      list[index]['location'],
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'Playfair Display',
                                                        color: Colors.green,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.arrow_forward_ios),
                                            color: Colors.grey,
                                            onPressed: () {

                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>tourguideDetailsPage(list[index]['name'])));

                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
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
        ));
  }
}