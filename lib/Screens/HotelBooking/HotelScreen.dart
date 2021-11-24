import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/MyNavigationBar.dart';
import 'package:flutter_auth/Components/loading.dart';
import 'package:flutter_auth/Screens/Destination/AllDestinations.dart';
import 'package:flutter_auth/Screens/Destination/Destination_List.dart';
import 'package:flutter_auth/Screens/Destination/Global/app_colors.dart';
import 'package:flutter_auth/Screens/HotelBooking/Hotel_Detail.dart';
import 'package:flutter_auth/Screens/HotelBooking/hotelDBService.dart';
import 'package:flutter_auth/Screens/TourGuide/TourGuideHome.dart';
import 'package:flutter_auth/Screens/TourGuide/workingfile.dart';
import 'package:flutter_auth/Screens/Transport/SelectTransport.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Hotels extends StatefulWidget {
  final String destination;

  Hotels(this.destination);

  @override
  _HotelsState createState() => _HotelsState();
}

class _HotelsState extends State<Hotels> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        title: const Text('Trek Pakistan',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
        centerTitle: true,


        backgroundColor: Colors.green,
      ),


      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Text("Book a Hotel", textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: AppColors.darkTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),



                ],
              ),
            ),
            Divider(color: Colors.black, height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              child: Text(
                'Top Rated Hotels',
                style: GoogleFonts.poppins(
                    color: AppColors.darkTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('hotels').where(
                    'destinationName', isEqualTo: widget.destination).snapshots(),
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
                  Text("No Hotel available for this location"),
                  TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>DestinationScreen() ));
                  }, child: Text("Choose another location"))
                  ],
                  ),
                  ),
                  ),
                  ),
                  );
                  }
                  else{
                  final list=querySnapshot.data.docs;
                  return Expanded(
                  child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                  onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HotelDetailsPage(list[index]['title'])));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    height: 250,
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
                    image: NetworkImage(list[index]['image']),
                    fit: BoxFit.cover,
                    ),
                    ),
                    ),
                    Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                    list[index]['title'],
                    style: TextStyle(fontSize: 14.0),
                    ),
                    ),
                    Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                    list[index]['description'],
                    style: TextStyle(fontSize: 13.0, color: Colors.grey),
                    ),
                    ),
                    Padding(
                    padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 10),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Text(
                    '\Rs.${list[index]['price']} / night',
                    style: TextStyle(color: Colors.greenAccent),
                    ),
                    Row(
                    children: <Widget>[
                    Text(
                    '${list[index]['rating']}',
                    style: TextStyle(color: Colors.greenAccent),
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
                })

          ],
        ),
      ),
    );
  }
}