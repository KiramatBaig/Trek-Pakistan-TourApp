import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/loading.dart';
import 'package:flutter_auth/Screens/Destination/Global/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';


class Preplannedtrips extends StatefulWidget {
  @override
  _PreplannedtripsState createState() => _PreplannedtripsState();
}

class _PreplannedtripsState extends State<Preplannedtrips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Trek Pakistan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        titleSpacing: 50,
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
        width: double.infinity,
        child: Column(
          children: [
            ///Container for header
            Container(
              width: double.infinity,
              child: Stack(
                children: [
                  ///Container for welcoming text
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pre-Planned Trips",
                          style: GoogleFonts.playfairDisplay(
                              color: AppColors.darkTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 36),
                        )
                      ],//children
                    ),
                  ),
                ],
              ),
            ),
            ///vertical spacing
            SizedBox(
              height: 10,
            ),
            //horizontal line
            Divider(
              thickness: 2,
              color: Colors.green,
            ),

            ///vertical spacing
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('hotels').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if (!snapshot.hasData) {
                    return Loading();
                  }
                  final list=snapshot.data.docs;
                  return GridView.builder(

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio: 0.7),
                    itemBuilder: (BuildContext context,  index) {
                      return Container(
                        alignment: Alignment.center,
                          decoration: BoxDecoration(

                            image: DecorationImage(image: NetworkImage(list[index]['image']),fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.lightGreenColor),
                          child: Stack(
                            children: [
                               


                              ///For rating and title
                              Positioned(
                                top: 20,
                                left: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      list[index]['title'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),

                                    ///Rating
                                    Chip(
                                      backgroundColor: Colors.white,
                                      label: Row(
                                        children: [
                                          Icon(Icons.star, color: AppColors.lightGreenColor, size: 15,),
                                          ///For  space
                                          SizedBox(width: 4,),
                                          Text(
                                            list[index]['rating'],
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: AppColors.veryLightTextColor,
                                                fontWeight: FontWeight.w700
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("5 Days",style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700
                                    ),),
                                        Text("Islamabad\n To\nNaran",style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                        ),),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                      );
                    },
                    itemCount: snapshot.data.docs.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

  }
}