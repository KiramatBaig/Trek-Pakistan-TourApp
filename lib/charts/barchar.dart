import 'package:flutter/material.dart';
import 'package:flutter_auth/Admin%20Portal/AdminScreens/AdminProfileScreen.dart';
import 'package:flutter_auth/charts/Earnings.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartsScreen extends StatefulWidget {
  final String tourguideCount;
  final String transCount;
  final String trekCount;
  final String hotelCount;
  final String tripsCount;
  ChartsScreen(this.hotelCount, this.tourguideCount, this.transCount,
      this.trekCount, this.tripsCount);
  @override
  _ChartsScreenState createState() => _ChartsScreenState();
}

class _ChartsScreenState extends State<ChartsScreen> {
  @override
  Widget build(BuildContext context) {
    final List<EarningsTimeline> listEarnings = [
      EarningsTimeline(
        year: 'Hotel',
        earning: double.parse(widget.hotelCount),
        color: charts.ColorUtil.fromDartColor
          (Color(0xFF47505F)),
      ),
      EarningsTimeline(
          year: 'Transport', earning: double.parse(widget.transCount),
          color: charts.MaterialPalette.blue.shadeDefault),
      EarningsTimeline(year: 'Trek', earning: double.parse(widget.trekCount),
          color: charts.MaterialPalette.pink.shadeDefault),
      EarningsTimeline(
          year: 'TourGuide', earning: double.parse(widget.tourguideCount),
      color: charts.ColorUtil.fromDartColor(Colors.purple)),
      EarningsTimeline(year: 'Trips', earning: double.parse(widget.tripsCount),
      color: charts.ColorUtil.fromDartColor(Colors.yellow),
      )
    ];

    List<charts.Series<EarningsTimeline, String>> timeline = [
      charts.Series(
        id: 'Subscribers',
        data: listEarnings,
        domainFn: (EarningsTimeline timeline, _) => timeline.year,
        measureFn: (EarningsTimeline timeline, _) => timeline.earning,
          colorFn: (EarningsTimeline timeline, _) => timeline.color,
          labelAccessorFn: (EarningsTimeline timeline, _) =>
          '${timeline.year}: ${timeline.earning.toString()}'

      )
    ];

    return Scaffold(
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
      body: Center(
          child: Container(
        height: 400,
        padding: EdgeInsets.all(10),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text("Total Registered Business",
                  style: TextStyle(fontSize: 22,
                      letterSpacing: 1,
                      color: Colors.green),
                ),
                Expanded(
                  child: charts.BarChart(timeline, animate: true,
                      animationDuration:new Duration(seconds: 1),
                    barRendererDecorator: new charts.BarLabelDecorator<String>(),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
