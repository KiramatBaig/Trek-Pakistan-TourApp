import 'package:flutter/material.dart';
import 'package:flutter_auth/Admin%20Portal/Components/FlowBar.dart';
import 'package:flutter_auth/Bussiness%20Portal/RegisterBussinessScreen.dart';
import 'package:flutter_auth/Bussiness%20Portal/RegisterPreplannedtrip.dart';
import 'package:flutter_auth/Bussiness%20Portal/RegisterTourguideScreen.dart';




class SelectBussinessWidget extends StatefulWidget {
  SelectBussinessWidget({Key key}) : super(key: key);

  @override
  _SelectBussinessWidgetState createState() =>
      _SelectBussinessWidgetState();
}

class _SelectBussinessWidgetState extends State<SelectBussinessWidget> {

  final scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Trek Pakistan",
          style: TextStyle(color: Colors.green),
        ),
        titleSpacing: 50.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF66BB6A)),
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.chevron_left,
            size: 40,
            color: Colors.green,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
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
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 50,
              ),
            ),
            Align(
              alignment: Alignment(-0.88, -0.87),
              child: FlowExample(),
            ),
            Align(
              alignment: Alignment(0, -0.80),
              child: Text(
                'Select Bussiness Type',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.45, 1),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 1),
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 200.0,
                                height: 30.0,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius:
                                    BorderRadius.circular(16),
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
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.4,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment: Alignment(
                                                      -0.1, -0.5),
                                                  child: Padding(
                                                    padding: EdgeInsets
                                                        .fromLTRB(
                                                        0, 15, 0, 0),
                                                    child: Text(
                                                      'TRANSPORT',
                                                      textAlign:
                                                      TextAlign.start,
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'Montserrat',
                                                        color: Color(
                                                            0xFF15212B),
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment(0.85, 0),
                                            child: Padding(
                                              padding:
                                              EdgeInsets.fromLTRB(
                                                  0, 0, 5, 0),
                                              child: IconButton(
                                                onPressed: () {

                                                },
                                                icon: Icon(
                                                  Icons.arrow_forward_ios_rounded,
                                                  color:
                                                  Color(0xFF66BB6A),
                                                  size: 32,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius:
                                    BorderRadius.circular(16),
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
                                              16, 1, 0, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.4,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment: Alignment(
                                                      -0.2, -0.5),
                                                  child: Padding(
                                                    padding: EdgeInsets
                                                        .fromLTRB(
                                                        0, 15, 0, 0),
                                                    child: Text(
                                                      'HOTEL',
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'Montserrat',
                                                        color: Color(
                                                            0xFF15212B),
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment(0.85, 0),
                                            child: Padding(
                                              padding:
                                              EdgeInsets.fromLTRB(
                                                  0, 5, 0, 0),
                                              child: IconButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (BuildContext context) => RegisterBussinessScreenWidget()));

                                                },
                                                icon: Icon(
                                                  Icons.arrow_forward_ios_rounded,
                                                  color:
                                                  Color(0xFF66BB6A),
                                                  size: 32,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius:
                                    BorderRadius.circular(16),
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
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.4,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment: Alignment(
                                                      0, -0.5),
                                                  child: Padding(
                                                    padding: EdgeInsets
                                                        .fromLTRB(
                                                        0, 15, 0, 0),
                                                    child: Text(
                                                      'TOUR GUIDE',
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'Montserrat',
                                                        color: Color(
                                                            0xFF15212B),
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment(0.85, 0),
                                            child: Padding(
                                              padding:
                                              EdgeInsets.fromLTRB(
                                                  0, 5, 5, 0),
                                              child: IconButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (BuildContext context) => RegisterTourguideScreenWidget()));

                                                },
                                                icon: Icon(
                                                  Icons.arrow_forward_ios_rounded,
                                                  color:
                                                  Color(0xFF66BB6A),
                                                  size: 32,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius:
                                    BorderRadius.circular(16),
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
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.4,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment: Alignment(
                                                      -0.1, -0.5),
                                                  child: Padding(
                                                    padding: EdgeInsets
                                                        .fromLTRB(
                                                        0, 0, 0, 0),
                                                    child: Text(
                                                      'PLANNED TRIPS',
                                                      style: TextStyle(
                                                        fontFamily:
                                                        'Montserrat',
                                                        color: Color(
                                                            0xFF15212B),
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment(0.85, 0),
                                            child: Padding(
                                              padding:
                                              EdgeInsets.fromLTRB(
                                                  0, 0, 5, 0),
                                              child: IconButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (BuildContext context) => RegisterPreplannedScreenWidget()));

                                                },
                                                icon: Icon(
                                                  Icons.arrow_forward_ios_rounded,
                                                  color:
                                                  Color(0xFF66BB6A),
                                                  size: 32,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}