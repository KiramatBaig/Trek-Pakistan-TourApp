import 'package:flutter/material.dart';
import 'package:flutter_auth/Admin%20Portal/Components/FlowBar.dart';


import 'EditDestinationScreen.dart';

class DestinationScreenWidget extends StatefulWidget {
  DestinationScreenWidget({Key key}) : super(key: key);

  @override
  _DestinationScreenWidgetState createState() =>
      _DestinationScreenWidgetState();
}

class _DestinationScreenWidgetState extends State<DestinationScreenWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController customController = new TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  createAlertDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Caution?"),
        content : Text("Do you Really want to Delete?"),

        actions: <Widget>[
          MaterialButton(
            elevation: (0.5),
            color: Colors.green,
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text("CANCEL"),),
          MaterialButton(
            elevation: (0.5),
            color: Colors.green,
            onPressed: (){
              print("button pressed");
            },
            child: Text("DELETE"),)
        ],
      );
    });
  }
  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Trek Pakistan",style: TextStyle(color: Colors.green),),
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Align(
                child: Icon(
                  Icons.hotel,
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
                  'MANAGE DESTINATION',
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
                          TabBar(
                            labelColor: Color(0xFF66BB6A),
                            indicatorColor: Color(0xFF66BB6A),
                            indicatorWeight: 3,
                            tabs: [
                              Tab(
                                text: 'ALL DESTINATIONS',
                                icon: Icon(
                                  Icons.shield,
                                  color: Color(0xFF66BB6A),
                                ),
                              ),
                              Tab(
                                text: 'ADD NEW',
                                icon: Icon(
                                  Icons.add_box,
                                  color: Color(0xFF66BB6A),
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 200.0,
                                        height: 30.0,),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment(0.75, 0),
                                              child: Text(
                                                'NAME',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment(1, 0),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 0, 0, 0),
                                                child: Text(
                                                  'EDIT',
                                                  style:TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment(0.9, 0),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 15, 0),
                                                child: Text(
                                                  'DELETE',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
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
                                                              'HUNZA',
                                                              textAlign:
                                                              TextAlign.start,
                                                              style:
                                                              TextStyle(
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
                                                  child: Align(
                                                    alignment: Alignment(1, 0),
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsets.fromLTRB(
                                                          1, 0, 5, 0),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          Navigator.of(context).push(MaterialPageRoute(
                                                              builder: (BuildContext context) => EditDestinationScreenWidget()));
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .edit_location_rounded,
                                                          color:
                                                          Color(0xFF66BB6A),
                                                          size: 32,
                                                        ),
                                                        iconSize: 32,
                                                      ),
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
                                                          createAlertDialog(context);
                                                        },
                                                        icon: Icon(
                                                          Icons.delete_forever,
                                                          color: Color(0xFF66BB6A),
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
                                                              -0.1, -0.5),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                0, 15, 0, 0),
                                                            child: Text(
                                                              'ISLAMABAD',
                                                              style:
                                                              TextStyle(
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
                                                  child: Align(
                                                    alignment: Alignment(1, 0),
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsets.fromLTRB(
                                                          0, 0, 5, 0),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .edit_location_rounded,
                                                          color:
                                                          Color(0xFF66BB6A),
                                                          size: 32,
                                                        ),
                                                        iconSize: 32,
                                                      ),
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
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                        icon: Icon(
                                                          Icons.delete_forever,
                                                          color: Color(0xFF66BB6A),
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
                                                                0, 15, 0, 0),
                                                            child: Text(
                                                              'KHANPUR',
                                                              style:
                                                              TextStyle(
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
                                                  child: Align(
                                                    alignment: Alignment(1, 0),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                      icon: Icon(
                                                        Icons
                                                            .edit_location_rounded,
                                                        color: Color(0xFF66BB6A),
                                                        size: 32,
                                                      ),
                                                      iconSize: 32,
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
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                        icon: Icon(
                                                          Icons.delete_forever,
                                                          color: Color(0xFF66BB6A),
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
                                                                0, 15, 0, 0),
                                                            child: Text(
                                                              'LAHORE',
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
                                                  child: Align(
                                                    alignment: Alignment(1, 0),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                      icon: Icon(
                                                        Icons
                                                            .edit_location_rounded,
                                                        color: Color(0xFF66BB6A),
                                                        size: 32,
                                                      ),
                                                      iconSize: 32,
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
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                        icon: Icon(
                                                          Icons.delete_forever,
                                                          color: Color(0xFF66BB6A),
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
                                Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(0, 16, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsets.fromLTRB(
                                                        0, 10, 0, 0),
                                                    child: Text(
                                                      'Add New Destination',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(0, 12, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: 330,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                      border: Border.all(
                                                        color: Color(0xFFE6E6E6),
                                                      ),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.fromLTRB(
                                                              100, 0, 0, 0),
                                                          child: TextFormField(
                                                            controller:
                                                            textController1,
                                                            obscureText: false,
                                                            decoration:
                                                            InputDecoration(
                                                              labelText:
                                                              'Field 1',
                                                              labelStyle:
                                                              TextStyle(
                                                                fontFamily:
                                                                'Montserrat',
                                                                color: Color(
                                                                    0xFF8B97A2),
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                              ),
                                                              enabledBorder:
                                                              UnderlineInputBorder(
                                                                borderSide:
                                                                BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      4.0),
                                                                ),
                                                              ),
                                                              focusedBorder:
                                                              UnderlineInputBorder(
                                                                borderSide:
                                                                BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      4.0),
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                            TextStyle(
                                                              fontFamily:
                                                              'Montserrat',
                                                              color: Color(
                                                                  0xFF8B97A2),
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 15, 0, 0),
                                                          child: Text(
                                                            'NAME : ',
                                                            style:
                                                            TextStyle(
                                                              fontFamily:
                                                              'Poppins',
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(0, 12, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: 330,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                      border: Border.all(
                                                        color: Color(0xFFE6E6E6),
                                                      ),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.fromLTRB(
                                                              100, 0, 0, 0),
                                                          child: TextFormField(
                                                            controller:
                                                            textController2,
                                                            obscureText: false,
                                                            decoration:
                                                            InputDecoration(
                                                              labelText:
                                                              'Field 2',
                                                              labelStyle:
                                                              TextStyle(
                                                                fontFamily:
                                                                'Montserrat',
                                                                color: Color(
                                                                    0xFF8B97A2),
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                              ),
                                                              enabledBorder:
                                                              UnderlineInputBorder(
                                                                borderSide:
                                                                BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      4.0),
                                                                ),
                                                              ),
                                                              focusedBorder:
                                                              UnderlineInputBorder(
                                                                borderSide:
                                                                BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      4.0),
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                            TextStyle(
                                                              fontFamily:
                                                              'Montserrat',
                                                              color: Color(
                                                                  0xFF8B97A2),
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 15, 0, 0),
                                                          child: Text(
                                                            'LOCATION : ',
                                                            style:
                                                            TextStyle(
                                                              fontFamily:
                                                              'Poppins',
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(0, 12, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: 330,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                      border: Border.all(
                                                        color: Color(0xFFE6E6E6),
                                                      ),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.fromLTRB(
                                                              100, 0, 0, 0),
                                                          child: TextFormField(
                                                            controller:
                                                            textController3,
                                                            obscureText: false,
                                                            decoration:
                                                            InputDecoration(
                                                              labelText:
                                                              'Field 3',
                                                              labelStyle:
                                                              TextStyle(
                                                                fontFamily:
                                                                'Montserrat',
                                                                color: Color(
                                                                    0xFF8B97A2),
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                              ),
                                                              enabledBorder:
                                                              UnderlineInputBorder(
                                                                borderSide:
                                                                BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      4.0),
                                                                ),
                                                              ),
                                                              focusedBorder:
                                                              UnderlineInputBorder(
                                                                borderSide:
                                                                BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                      4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                      4.0),
                                                                ),
                                                              ),
                                                            ),
                                                            style:
                                                            TextStyle(
                                                              fontFamily:
                                                              'Montserrat',
                                                              color: Color(
                                                                  0xFF8B97A2),
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                            maxLines: 10,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 15, 0, 0),
                                                          child: Text(
                                                            'DESCRIPTION :',
                                                            style:
                                                            TextStyle(
                                                              fontFamily:
                                                              'Poppins',
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'ADD IMAGE',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment(-0.05, 0),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                    icon: Icon(
                                                      Icons.add_box_outlined,
                                                      color: Color(0xFF66BB6A),
                                                      size: 30,
                                                    ),
                                                    iconSize: 30,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment(0.95, 0),
                                            child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 16, 0, 0),
                                                child: RaisedButton(
                                                  onPressed: () {},
                                                  color: Colors.green,
                                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                                  elevation: 2,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20)),
                                                  child: Text(
                                                    "SAVE",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        letterSpacing: 2.2,
                                                        color: Colors.white),
                                                  ),
                                                )
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
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
      ),
    );
  }
}