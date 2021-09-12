import 'package:flutter/material.dart';
import 'package:flutter_auth/Admin%20Portal/AdminScreens/AdminHotelScreen.dart';
import 'package:flutter_auth/Admin%20Portal/AdminScreens/AdminProfileScreen.dart';
import 'package:flutter_auth/Admin%20Portal/AdminScreens/ManageDestination.dart';
import 'package:flutter_auth/Admin%20Portal/Components/adminFrostedDrawer.dart';


import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AdminHomeScreen extends StatefulWidget {
  AdminHomeScreen({Key key}) : super(key: key);

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
      backgroundColor: Color(0xFF43A047),
      drawer: FrostedDrawer(),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.38,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Container(
                  width: double.infinity,
                  height: 500,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                        child: PageView(
                          controller: pageViewController,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: Alignment(0.05, -0.85),

                                  child: Text(
                                    'ADMIN PORTAL',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black54,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(0.02, -0.04),
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://picsum.photos/seed/415/600',
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(0.06, 0.87),
                                  child: Text(
                                    'Admin123',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF8D8181),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.05, 0.95),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: SmoothPageIndicator(
                            controller: pageViewController,
                            count: 3,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) {
                              pageViewController.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            effect: ExpandingDotsEffect(
                              expansionFactor: 2,
                              spacing: 8,
                              radius: 16,
                              dotWidth: 16,
                              dotHeight: 16,
                              dotColor: Color(0xFFA49C9C),
                              activeDotColor: Color(0xFF66BB6A),
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              child: Container(
                //width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height * 0.60,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1.2,
                  ),
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 5),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 80, height:25),
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          child: Text("Transport",),
                          style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              primary: Color(0xFF66BB6A),
                              //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 5),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 80, height:25),
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          child: Text("Add Trips",),
                          style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              primary: Color(0xFF66BB6A),
                              //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 20, 5),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 80, height:25),
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          child: Text("Tour Guide",),
                          style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              primary: Color(0xFF66BB6A),
                              //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 5),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 80, height:25),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => HomePageWidget()));

                          },
                          child: Text("Hotel",),
                          style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              primary: Color(0xFF66BB6A),
                              //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 20, 5),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 80, height:25),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => DestinationScreenWidget()
                            )
                            );
                          },
                          child: Text("Manage Destination",),
                          style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              primary: Color(0xFF66BB6A),
                              //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}