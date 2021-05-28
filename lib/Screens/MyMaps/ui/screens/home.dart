import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/BottomNavBar/fancy_tab_bar.dart';
import 'package:flutter_auth/Screens/MyMaps/ui/widgets/departureselector.dart';
import 'package:flutter_auth/Screens/MyMaps/ui/widgets/locationselectorcontainer.dart';
import 'package:flutter_auth/Screens/MyMaps/ui/widgets/meanstransportmenu.dart';
import 'package:flutter_auth/Screens/MyMaps/ui/widgets/ticketcontainer.dart';

class MapsHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
        ),
      ),
      bottomNavigationBar: FancyTabBar(),

      body: SafeArea(
        child: Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      DepartureSelector(),
                    ],
                  ),
                  LocationSelectorContainer(),
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, -5),
                      blurRadius: 9,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    MeansTransportMenu(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (ctx, i) {
                          return TicketContainer();
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
