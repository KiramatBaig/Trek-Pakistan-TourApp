
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/MyNavigationBar.dart';
import 'package:flutter_auth/Screens/Destination/Global/app_colors.dart';
import 'package:flutter_auth/Screens/HotelBooking/hotelDBService.dart';
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
  List HotelsList=[];
  @override
  void initState() {
    super.initState();
    fetchDatabaseList();

  }

  fetchDatabaseList() async{
    String destination= widget.destination;
    dynamic resultant= await HotelDBService(destination).getHotelList();
    if(resultant==null){
      Fluttertoast.showToast(msg: "No Hotels in this area");
    }else{
      setState(() {
        HotelsList=resultant;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        title: const Text('Trek Pakistan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        titleSpacing: 50,
        actions: [
          IconButton(icon: Icon(Icons.home,color: Colors.white,size: 30,), onPressed: (){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                MyNavigationBar()), (Route<dynamic> route) => false);
          }),
        ],

        backgroundColor: Colors.green,
      ),


      body: ListView(
        children: [
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("Book a Hotel", textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: AppColors.darkTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(width: 120.0,),
              TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>Transport() ));
              }, child:
              Text("Skip")),


            ],
          ),
          Divider(color: Colors.black,height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 50.0),
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
          Container(
            height: 250,
            width: double.infinity,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              scrollDirection: Axis.horizontal,
              itemCount: HotelsList.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  height: 80,
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
                            image: AssetImage('assets/images/room4.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          HotelsList[index]['title'],
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          HotelsList[index]['description'],
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
                              '\$${HotelsList[index]['price']} / night',
                              style: TextStyle(color: Colors.greenAccent),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  '${HotelsList[index]['rating']}',
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
