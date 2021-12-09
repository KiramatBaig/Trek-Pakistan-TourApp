import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/loading.dart';
import 'package:flutter_auth/Components/rounded_button.dart';
import 'package:flutter_auth/Screens/Destination/Global/app_colors.dart';
import 'package:flutter_auth/Screens/Trekking/TrekDBServices.dart';
import 'package:flutter_auth/Screens/HotelBooking/HotelScreen.dart';
import 'package:flutter_auth/Screens/HotelBooking/Hotel_Book.dart';
import 'package:flutter_auth/Screens/Trekking/trekDetail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class TrekcityList extends StatefulWidget {
  @override
  _TrekcityListState createState() => _TrekcityListState();
}

class _TrekcityListState extends State<TrekcityList> {

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
                          "Trek Locations",
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
                  stream: FirebaseFirestore.instance.collection('Trek').where('status',isEqualTo: 'accepted').snapshots(),
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
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,index){
                          return  Padding(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                            child: Card(
                              child: Container(
                                padding: EdgeInsets.only(left: 10,top: 0,right: 10),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Colors.green,
                                        Colors.blue,
                                      ],
                                    )
                                  // color: Colors.grey.withOpacity(0.7),

                                ),
                                child: ExpansionTile(
                                  tilePadding: EdgeInsets.only(left: 10,right: 10),
                                  leading: Text(
                                    list[index]['City'],textAlign: TextAlign.justify,
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                                  ),
                                  childrenPadding: EdgeInsets.only(left: 20,right: 20),
                                  children: [
                                    Column(
                                        children:[
                                          ListTile(
                                            title: Text(
                                              list[index]['description'],
                                              style: TextStyle(fontWeight: FontWeight.w300,),textAlign: TextAlign.start,
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          RoundedButton(press: (){

                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>trekDetailPage(list[index]['City'])));
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