import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/rounded_button.dart';
import 'package:flutter_auth/Screens/Destination/destinationDBService.dart';
import 'package:flutter_auth/Screens/HotelBooking/HotelScreen.dart';
import 'package:flutter_auth/Screens/HotelBooking/Hotel_Book.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'Global/app_colors.dart';

class DestinationList extends StatefulWidget {
  @override
  _DestinationListState createState() => _DestinationListState();
}

class _DestinationListState extends State<DestinationList> {
  List destinationsList=[];
  @override
  void initState() {
    super.initState();
    fetchDatabaseList();

  }

  fetchDatabaseList() async{
    dynamic resultant= await destinationDBService().getDestinationList();
    if(resultant==null){
      print("unable to retrieve");
    }else{
      setState(() {
        destinationsList=resultant;
      });
    }
  }
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
                        "Destinations",
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

          Expanded(child: ListView.builder(
              itemCount: destinationsList.length,
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
                            color: Colors.grey.withOpacity(0.7),

                          ),
                          child: ExpansionTile(

                            tilePadding: EdgeInsets.only(left: 10,right: 10),
                            leading: Text(
                              destinationsList[index]['name'],textAlign: TextAlign.justify,
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                            ),

                            title: RatingBar.builder(
                              ignoreGestures: true,

                              initialRating: double.parse(destinationsList[index]['rating']),
                              itemSize: 15,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,

                              ),


                            ),
                            childrenPadding: EdgeInsets.only(left: 20,right: 20),
                            children: [
                              Column(
                                children:[
                                  ListTile(
                                    title: Text(
                                      destinationsList[index]['description'],
                                      style: TextStyle(fontWeight: FontWeight.w300,),textAlign: TextAlign.start,
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  RoundedButton(press: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Hotels(destinationsList[index]['name'])));
                                  },text: "Select",),
                                ]
                              )
                            ],

                          ),
                        ),
                      ),


                );
              }),)
        ],
      )
    );
  }
}
