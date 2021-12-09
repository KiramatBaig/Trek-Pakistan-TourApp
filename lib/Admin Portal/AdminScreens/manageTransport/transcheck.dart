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


class TransList extends StatefulWidget {
  @override
  _TransListState createState() => _TransListState();
}

class _TransListState extends State<TransList> {

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
                          "transport list check",
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
                  stream: FirebaseFirestore.instance.collection('Transport').where('status',isEqualTo: 'accepted').snapshots(),
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
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Card(
                                clipBehavior:
                                Clip.antiAliasWithSaveLayer,
                                color: Colors.white,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(16),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          16, 0, 0, 0),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                            Alignment(-0.1, -0.5),
                                            child: Text(
                                              list[index]['name'],
                                              style: TextStyle(
                                                fontFamily:
                                                'Montserrat',
                                                color:
                                                Color(0xFF15212B),
                                                fontSize: 18,
                                                fontWeight:
                                                FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                            Alignment(2.64, 0.55),
                                            child: Row(
                                              children: <Widget>[
                                                Text('Rating:  ',
                                                  style:TextStyle(
                                                    fontFamily:
                                                    'Montserrat',
                                                    color:
                                                    Colors.blueGrey,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                Icon(Icons.sentiment_satisfied,color: Colors.green,),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Align(
                                        alignment: Alignment(1, 0),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            'https://picsum.photos/seed/913/400',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: Alignment(0.05, 0),
                                        child: Icon(
                                          Icons.chevron_right,
                                          color: Color(0xFF66BB6A),
                                          size: 28,
                                        ),
                                      ),
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
