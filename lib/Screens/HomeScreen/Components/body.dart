
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/BottomNavBar/fancy_tab_bar.dart';
import 'package:flutter_auth/Screens/Destination/home_screen.dart';
import 'package:flutter_auth/Screens/HotelBooking/Hotel_Book.dart';
import 'package:flutter_auth/Screens/Profile_Edit/edit_profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_auth/Components/Drawer.dart';


class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Trek Pakistan",style: TextStyle(color: Colors.green),),
        titleSpacing: 50.0,

        backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.green),
        actions: [
          Align(
            alignment: Alignment(0.3, 0.35),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.width * 0.15,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
               child: IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SettingsUI()));
                  },
                ),
              ),
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),

      drawer: FrostedDrawer(),
      bottomNavigationBar: FancyTabBar(),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Container(
              height: size.height,
              width: size.width,

              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.purple,
                gradient: new LinearGradient(
                    colors: [Colors.green, Colors.cyan],
                    begin: Alignment.centerRight,
                    end: new Alignment(-1.0, -1.0)
                ),

              ),
            ),
          ),

          Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 260,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white.withOpacity(0.9),
                  ),
                  child: GridView(
                    padding: EdgeInsets.all(1.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      FlatButton(
                        shape: CircleBorder(),
                        onPressed: () => {},
                        color: Colors.green,

                        padding: EdgeInsets.all(10.0),
                        child: Column( // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(Icons.miscellaneous_services,color:Colors.white,size: 60,),
                            Text("   "),
                            Text("Services",style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),

                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () => {},
                        color: Colors.green,
                        padding: EdgeInsets.all(10.0),
                        child: Column( // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(FontAwesomeIcons.ticketAlt,color: Colors.white,size: 60,),
                            Text("   "),
                            Text("Ticket",style: TextStyle(color: Colors.white),),

                          ],
                        ),
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => HomeScreen()));
                        },
                        color: Colors.green,
                        padding: EdgeInsets.all(10.0),
                        child: Column( // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(FontAwesomeIcons.mapMarked,color: Colors.white,size: 60,),
                            Text("   "),
                            Text("Destination",style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () => {},
                        color: Colors.green,
                        padding: EdgeInsets.all(10.0),
                        child: Column( // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(Icons.person_search_sharp,color: Colors.white,size: 60,),
                            Text("Travel Agents",style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () => {},
                        color: Colors.green,
                        padding: EdgeInsets.all(10.0),
                        child: Column( // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(FontAwesomeIcons.bus,color: Colors.white,size: 50,),
                            Text("   "),
                            Text("Transport",style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => HotelBookingPage()));
                        },
                        color: Colors.green,
                        padding: EdgeInsets.all(10.0),
                        child: Column( // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(Icons.hotel,color: Colors.white,size: 60,),
                            Text("Hotels",style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),


        ],


      ),


    );

  }


}


