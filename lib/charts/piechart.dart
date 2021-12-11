import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_auth/Admin%20Portal/AdminScreens/AdminProfileScreen.dart';

class mypie extends StatefulWidget{
  final int tourguideCount;
  final int transCount;
  final int trekCount;
  final int hotelCount;
  final int tripsCount;
  mypie(this.tripsCount,this.trekCount,this.transCount,this.tourguideCount,this.hotelCount);


  @override
  _mypieState createState()=>new _mypieState();
}
class Sales{
  int year;
  int sales;
  charts.Color color;
  Sales(this.year,this.sales,this.color);
}
class _mypieState extends State<mypie>{

  List<Sales> _data;
  List<charts.Series<Sales,int>> _chartData;
  void makeData(){

    _chartData=new List<charts.Series<Sales,int>>();
    //int trans = 45;
    _data=<Sales>[
      new Sales(0, widget.transCount, charts.MaterialPalette.red.shadeDefault),
      new Sales(1, widget.tripsCount, charts.MaterialPalette.blue.shadeDefault),
      new Sales(2, widget.trekCount, charts.MaterialPalette.green.shadeDefault),
      new Sales(3, widget.hotelCount, charts.MaterialPalette.yellow.shadeDefault),
     new Sales(4, widget.tourguideCount, charts.MaterialPalette.pink.shadeDefault),
    ];
    _chartData.add(new charts.Series(
        id:'Sales' ,
        data: _data,
        colorFn: (Sales sales,_)=>sales.color,
        domainFn: (Sales sales,_)=>sales.year,
        displayName: 'sales',
        fillPatternFn: (Sales sales,__)=>charts.FillPatternType.forwardHatch,
        measureFn: (Sales sales,_)=>sales.sales));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    makeData();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
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
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text("Total Business",
                style: TextStyle(fontSize: 22,
                color: Colors.green),
            ),
            new Expanded(child: new charts.PieChart<dynamic>(_chartData,
                animate: true,
                animationDuration:new Duration(seconds: 1))),
            new Expanded(
              child: Icon(Icons.crop_square_rounded,),
            )
          ],
        ),
      ),
    );
  }
}