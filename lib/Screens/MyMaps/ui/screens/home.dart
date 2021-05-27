import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/MyMaps/ui/widgets/departureselector.dart';
import 'package:flutter_auth/Screens/MyMaps/ui/widgets/locationselectorcontainer.dart';
import 'package:flutter_auth/Screens/MyMaps/ui/widgets/meanstransportmenu.dart';
import 'package:flutter_auth/Screens/MyMaps/ui/widgets/ticketcontainer.dart';

class MapsHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(Icons.map, color: Colors.grey),
                  ),
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(Icons.person_pin_circle, color: Colors.grey),
                  ),
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.orange, Colors.orangeAccent]),
                        borderRadius: BorderRadius.circular(9.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.orange,
                              blurRadius: 3.0,
                              offset: Offset(0, 3)),
                        ],
                      ),
                      child: Icon(
                        Icons.confirmation_number,
                        color: Colors.white,
                      )),
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(Icons.location_city, color: Colors.grey),
                  ),
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(Icons.person, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                        NetworkImage("https://googleflutter.com/sample_image.jpg"),
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Depart at: ",
                        style: TextStyle(
                            color: Colors.white.withOpacity(.79),
                            fontSize: 15.0),
                      ),
                      DepartureSelector(),
                      Spacer(),
                      FlatButton.icon(
                        onPressed: () {},
                        label: Text(
                          "Filters",
                          style:
                              TextStyle(color: Colors.white.withOpacity(.85)),
                        ),
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white.withOpacity(.85),
                        ),
                      )
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
