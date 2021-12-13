import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Admin%20Portal/AdminScreens/AdminProfileScreen.dart';
import 'package:flutter_auth/Components/loading.dart';
import 'package:flutter_auth/Components/rectangular_button.dart';
import 'package:flutter_auth/Models/PrePlannedTrip_Model.dart';

import 'package:flutter_auth/Models/TrekModel.dart';
import 'package:flutter_auth/Models/destinations_model.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/sentimentalModule/Components/lang/main_senti.dart';
import 'package:flutter_auth/sentimentalModule/sentichek.dart';
import 'package:flutter_auth/sentimentalModule/userMod/tourGuideSenti.dart';

class Destibuld extends StatefulWidget {
  final String value;
  final String value2;
  final String budget;
  final String interst1;
  final String interst2;

  Destibuld(this.value, this.value2, this.budget,this.interst1,this.interst2);
  @override
  _DestibuldState createState() => _DestibuldState();
}

class _DestibuldState extends State<Destibuld> {
  List<String> detinames = [];
  List<String> loc = [];

  List<String> makelst() {
    List<String> lst = [];
    lst.add(widget.value);
    lst.add(widget.value2);

    return lst;
  }

  void Sentithis(String a, String c) {
    final sentiment = Sentiment();
    //print(sentiment.analysis(a));
    Map<String, dynamic> b = sentiment.analysis(a);
    if (b.values.first > 0) {
      if (detinames.contains(c)) {
        if (loc.contains(c)) {
          print("duplicate not adding");
        } else {
          loc.add(c);
          print("location add $c");
        }
      } else {
        print("no common cities in reviews and destination");
      }
    } else {
      print("ratting is low");
    }

    //print(b.values.first);
  }


  finddes() async {
    FirebaseFirestore.instance.collection('reviews').get().then((value) {
      if (value.docs.length > 0) {
        for (int i = 0; i < value.docs.length; i++) {
          //print(value.docs[i].get('review'));
          //loc.add(value.docs[i].get('location'));
          //String a = value.docs[i].get('location');
          Sentithis(value.docs[i].get('review'), value.docs[i].get('location'));
        }
      }
      for (int i = 0; i < loc.length; i++) {
        print(loc[i]);
      }
      //print(value.docs);
    });
  }
  
  DestinationModel destinations = DestinationModel();
  PrePlannedTripModel preplannedtrips = PrePlannedTripModel();

  @override
  Stream stream;

  @override
  void initState() {
    super.initState();
    stream = FirebaseFirestore.instance
        .collection('destinations')
        //     .where('Category', arrayContainsAny: [
        //   widget.value,
        //   widget.value2,
        //   widget.value2,
        //   widget.value,
        // ])
        .where('name', arrayContains: loc)
        //.where('Category', isEqualTo: widget.value)
        .snapshots();
  }

  Widget build(BuildContext context) {
    finddes();
    return Scaffold(
      appBar: PreferredSize(
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
                finddes();
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) => AdminProfileWidget()));
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

      body: Stack(
        children: <Widget>[
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: AutoSizeText(
                      'Tour Recommender',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 2),
                      child: Container(
                        //width: 100px,
                        width: 500,
                        height: 200,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: Image.asset(
                          'assets/images/AI.jpeg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
                    child: Text(
                      'TOP GEOGRAPHY',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.green,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('destinations')
                        .where('Category', arrayContainsAny: [
                      widget.value,
                      widget.value2,
                      widget.value2,
                      widget.value
                    ])
                        //.where('Category', whereIn: [widget.value2,widget.value])
                        //.where('Category', isEqualTo: widget.value)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> querySnapshot) {
                      if (querySnapshot.hasError) {
                        return (Text("An error has occured"));
                      }
                      if (querySnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Loading();
                      } else {
                        final list = querySnapshot.data.docs;

                        print("list is made");
                        print(list.length);

                        // FirebaseFirestore.instance.collection('destinations').where('name', arrayContainsAny: list).get();
                        // detinames.add(list.toString());

                        return ListView.builder(
                          itemCount: list.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            detinames.add(list[index]['name']);
                            print(detinames);
                            return Padding(
                              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.white,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(16, 0, 0, 0),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment(-0.1, -0.5),
                                              child: Text(
                                                list[index]['name']
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF15212B),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment(2.64, 0.55),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Rating:  ',
                                                    style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.blueGrey,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.sentiment_satisfied,
                                                    color: Colors.green,
                                                  ),
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
                                              list[index]['Image'],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment: Alignment(0.05, 0),
                                          child: IconButton(
                                              icon: Icon(
                                                Icons.chevron_right,
                                                color: Color(0xFF66BB6A),
                                                size: 28,
                                              ),
                                              onPressed: () {
                                                // Navigator.of(context).push(MaterialPageRoute(
                                                //     builder: (BuildContext context) =>
                                                //         HotelDel(list[index]['title'])));
                                              }),
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
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
                    child: Text(
                      'BEST BUDGET TRIPS',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.green,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('preplannedtrips')
                        //.where('fromLocation', arrayContains: detinames)
                        .where('priceperhead',
                            isLessThanOrEqualTo: double.parse(widget.budget))
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> querySnapshot) {
                      if (querySnapshot.data == null) {
                        return (Text("no trips for ths budget"));
                      }
                      if (querySnapshot.hasError) {
                        return (Text("An error has occured"));
                      }
                      if (querySnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Loading();
                      } else {
                        final list = querySnapshot.data.docs;

                        print("list is made");
                        print(list.length);

                        return ListView.builder(
                          itemCount: list.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            List<String> tournames = [];
                            tournames.add(list[index]['host']);
                            print(tournames.toString());
                            return Padding(
                              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.white,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(16, 0, 0, 0),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment(-0.1, -0.5),
                                              child: Text(
                                                list[index]['host']
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF15212B),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment(2.64, 0.55),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Rating:  ',
                                                    style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.blueGrey,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.sentiment_satisfied,
                                                    color: Colors.green,
                                                  ),
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
                                              list[index]['image'],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment: Alignment(0.05, 0),
                                          child: IconButton(
                                              icon: Icon(
                                                Icons.chevron_right,
                                                color: Color(0xFF66BB6A),
                                                size: 28,
                                              ),
                                              onPressed: () {
                                                // Navigator.of(context).push(MaterialPageRoute(
                                                //     builder: (BuildContext context) =>
                                                //         HotelDel(list[index]['title'])));
                                              }),
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
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
                    child: Text(
                      'INTEREST BASED TRIPS',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.green,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('preplannedtrips')
                        .where('description',
                            isGreaterThanOrEqualTo: 'Photography')
                        //     .where('description', arrayContains: [
                        //   'photography',
                        //   'stay',
                        //   ','
                        // ])
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> querySnapshot) {
                      if (querySnapshot.hasError) {
                        return (Text("An error has occured"));
                      }
                      if (querySnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Loading();
                      }
                      if (querySnapshot.hasData) {
                        final list = querySnapshot.data.docs;

                        print("list is made");
                        print(list.length);
                        finddes();

                        return ListView.builder(
                          itemCount: list.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.white,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(16, 0, 0, 0),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment(-0.1, -0.5),
                                              child: Text(
                                                list[index]['host']
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF15212B),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment(2.64, 0.55),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Rating:  ',
                                                    style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.blueGrey,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.sentiment_satisfied,
                                                    color: Colors.green,
                                                  ),
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
                                              list[index]['image'],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment: Alignment(0.05, 0),
                                          child: IconButton(
                                              icon: Icon(
                                                Icons.chevron_right,
                                                color: Color(0xFF66BB6A),
                                                size: 28,
                                              ),
                                              onPressed: () {
                                                // Navigator.of(context).push(MaterialPageRoute(
                                                //     builder: (BuildContext context) =>
                                                //         (list[index]['host'].toString())));
                                              }),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return (Text("no data on interest"));
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
                    child: Text(
                      'TOP DESTINATIONS',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.green,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('destinations')
                        //     .where('Category', arrayContainsAny: [
                        //   widget.value,
                        //   widget.value2,
                        //   widget.value2,
                        //   widget.value,
                        // ])
                        //.where('name', whereIn: List.of(loc.toList()))
                        //.where('Category', isEqualTo: widget.value)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> querySnapshot) {
                      if (querySnapshot.data.docs.isEmpty) {
                        return (Text("the ai  top des is empty"));
                      }
                      if (querySnapshot.hasError) {
                        return (Text("An error has occured in AI"));
                      }
                      var not=true;


                      if (querySnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Loading();
                      } else {
                        final list = querySnapshot.data.docs;

                        print("list is made for ai loc");
                        print(list.length);
                        return ListView.builder(

                          itemCount: list.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {

                            return Padding(

                              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.white,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(16, 0, 0, 0),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment(-0.1, -0.5),
                                              child: Text(
                                                list[index]['name']
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF15212B),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment(2.64, 0.55),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Rating:  ',
                                                    style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.blueGrey,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.sentiment_satisfied,
                                                    color: Colors.green,
                                                  ),
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
                                              list[index]['Image'],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment: Alignment(0.05, 0),
                                          child: IconButton(
                                              icon: Icon(
                                                Icons.chevron_right,
                                                color: Color(0xFF66BB6A),
                                                size: 28,
                                              ),
                                              onPressed: () {
                                                // Navigator.of(context).push(MaterialPageRoute(
                                                //     builder: (BuildContext context) =>
                                                //         HotelDel(list[index]['title'])));
                                              }),
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
                  ),


                      IconButton(
                          icon: Icon(
                            Icons.chevron_right,
                            color: Color(0xFF66BB6A),
                            size: 28,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                TourSenti(loc)));
                          }),





                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
