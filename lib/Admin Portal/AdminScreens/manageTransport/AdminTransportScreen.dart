import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Admin%20Portal/AdminScreens/manageTransport/ShowTransport.dart';
import 'package:flutter_auth/Admin%20Portal/AdminScreens/manageTransport/acceptTransport.dart';
import 'package:flutter_auth/Admin%20Portal/Components/FlowBar.dart';
import 'package:flutter_auth/Components/loading.dart';



class AdminTransportPageWidget extends StatefulWidget {
  AdminTransportPageWidget({Key key}) : super(key: key);

  @override
  _AdminTransportPageWidgetState createState() => _AdminTransportPageWidgetState();
}

class _AdminTransportPageWidgetState extends State<AdminTransportPageWidget> {
  String dropDownValue;
  String finalDate = '';

  getCurrentDate() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    setState(() {
      finalDate = formattedDate.toString();
    });
  }
  final scaffoldKey = GlobalKey<ScaffoldState>();


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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: Stack(
            children: [
              Align(
                child: Icon(
                  Icons.hotel,
                  color: Colors.black,
                  size: 50,
                ),
              ),
              // Align(
              //   alignment: Alignment(-0.88, -0.87),
              //   child: FlowExample(),
              // ),
              Align(
                alignment: Alignment(-0.06, -0.83),
                child: Text(
                  'MANAGE TRANSPORT',
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
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Color(0xFF66BB6A),
                          indicatorColor: Colors.grey,
                          tabs: [
                            Tab(
                              text: 'APPROVED',
                              icon: Icon(
                                Icons.shield,
                                color: Color(0xFF66BB6A),
                              ),
                            ),
                            Tab(
                              text: 'REQUESTS',
                              icon: Icon(
                                Icons.assignment_late_sharp,
                                color: Color(0xFF66BB6A),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(20, 16, 0, 0),
                                        child: Text(
                                          "Date = date.now()",
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF8B97A2),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
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
                                                              child: IconButton(
                                                                icon: Icon(Icons.chevron_right,color: Color(0xFF66BB6A),
                                                                  size: 28,),
                                                                onPressed: (){
                                                                  Navigator.of(context).push(MaterialPageRoute(
                                                                      builder: (BuildContext context) =>
                                                                      TransportShowPage(list[index]['name'])));
                                                                }
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
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(20, 16, 0, 0),
                                        child: Text(
                                          'May 25, 2021',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF8B97A2),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                      child: StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance.collection('Transport').where('status',isEqualTo: 'pending').snapshots(),
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
                                                              child: IconButton(
                                                                  icon: Icon(Icons.chevron_right,color: Color(0xFF66BB6A),
                                                                    size: 28,),
                                                                  onPressed: (){
                                                                    Navigator.of(context).push(MaterialPageRoute(
                                                                        builder: (BuildContext context) =>
                                                                            TransportacceptPage(list[index]['name'])));
                                                                  }
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
                            ],
                          ),
                        ),
                      ],
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