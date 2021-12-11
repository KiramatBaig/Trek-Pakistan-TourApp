import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_auth/Admin%20Portal/AdminScreens/TrekManage/TrekManageHome.dart';
import 'package:flutter_auth/Admin%20Portal/AdminScreens/manageHotel/AdminHotelScreen.dart';
import 'package:flutter_auth/Admin%20Portal/AdminScreens/manageTransport/AdminTransportScreen.dart';
import 'package:flutter_auth/Components/loading.dart';
import 'package:flutter_auth/charts/barchar.dart';
import 'package:flutter_auth/charts/piechart.dart';


import 'AdminProfileScreen.dart';
import '../TourGuideManage/AdminTourGuideScreen.dart';
import 'managedestination/ManageDestination.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tourguideCount;
  int transCount;
  int trekCount;
  int hotelCount;
  int tripsCount;
  countDocuments() async {
    QuerySnapshot _myDoc = await FirebaseFirestore.instance.collection(
        'TourGuide').get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    tourguideCount = _myDocCount.length;
    print(tourguideCount);

    QuerySnapshot _trans = await FirebaseFirestore.instance.collection(
        'Transport').get();
    List<DocumentSnapshot> _transCount = _trans.docs;
    transCount = _transCount.length;
    print(transCount);

    QuerySnapshot _trek = await FirebaseFirestore.instance.collection('Trek')
        .get();
    List<DocumentSnapshot> _trekCount = _trek.docs;
    trekCount = _trekCount.length;
    print(trekCount);

    QuerySnapshot _hotel = await FirebaseFirestore.instance.collection(
        'preplannedtrips').get();
    List<DocumentSnapshot> _hotelCount = _hotel.docs;
    hotelCount = _hotelCount.length;
    print(hotelCount);

    QuerySnapshot _trips = await FirebaseFirestore.instance.collection('hotels')
        .get();
    List<DocumentSnapshot> _tripsCount = _trips.docs;
    tripsCount = _tripsCount.length;
    print(tripsCount);
    if (ConnectionState.waiting != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => ChartsScreen(
              tourguideCount.toString(), transCount.toString(), trekCount.toString(),
              hotelCount.toString(), tripsCount.toString()
          )
              // mypie(
              // tourguideCount, transCount, trekCount, hotelCount, tripsCount)
      )
      );

    } else {
      return Loading();
      //mypie(tourguideCount,transCount,trekCount,hotelCount, tripsCount);// Count of Documents in Collection
    }
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(60.0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFF43A047)),
          automaticallyImplyLeading: true,
          title: Text(
            'TREK PAKISTAN',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF43A047),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AdminProfileWidget()));
              },
              icon: Icon(
                Icons.admin_panel_settings,
                color: Color(0xFF66BB6A),
                size: 30,
              ),
              iconSize: 30,
            )
          ],
          centerTitle: true,
          elevation: 4,
        ),
      ),

      // drawer: Drawer(
      //   elevation: 16,
      // ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Kiramat baig"),
              accountEmail: new Text("kiramatbaig@gmail.com"),
              decoration: new BoxDecoration(

                image: new DecorationImage(
                  image: new ExactAssetImage('assets/images/adminimg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/dp.jpg'),
              ),
            ),
            new ListTile(
                leading: Icon(Icons.apps),
                title: new Text("Apps"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.dashboard),
                title: new Text("Docs"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.settings),
                title: new Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new Divider(),
            new ListTile(
                leading: Icon(Icons.info),
                title: new Text("About"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.power_settings_new),
                title: new Text("Logout"),
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  height: 120,
                  width: 500,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new ExactAssetImage('assets/images/tourist.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "ADMIN PORTAL",
                        style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold,fontSize: 34,),
                      ),
                      Text(
                        'Kiramat baig',
                        style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,letterSpacing: 3),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      InkWell(
                        onTap:  (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => AdminTransportPageWidget()));
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.bus_alert,
                                color: Colors.green,
                                size: 110,
                              ),
                              //Image.asset('assets/images/transport.png',height: 120,),
                              Text(
                                  'TRANSPORT',
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => HomePageWidget()));
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.hotel_rounded,
                                color: Colors.green,
                                size: 110,),
                              Text(
                                  'HOTEL',
                                style: TextStyle(
                                  letterSpacing: 1,
                                fontSize: 18,
                              ),),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => TrekmanageHome()));
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.person_pin_circle_sharp,size: 120, color: Colors.green,),
                              Text('TREKING',
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                ),),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => TourGuidePageWidget()
                          )
                          );
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('assets/images/tourguide.png',height: 110,),
                              Text('TOUR GUIDES',
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                ),),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => DestinationScreenWidget()
                          )
                          );
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('assets/images/destination.png',height: 110,),
                              Text('DESTINATION',
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                ),),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          countDocuments();
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (BuildContext context) => mypie(tourguideCount,transCount,trekCount,hotelCount, tripsCount)
                          // )
                          // );

                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.add_chart,
                                color: Colors.green,
                                size: 110,
                              ),
                              Text('STATISTICS',
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                ),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}