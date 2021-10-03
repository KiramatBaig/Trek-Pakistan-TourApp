import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_auth/Bussiness%20Portal/SelectBussiness.dart';

import 'package:flutter_auth/Components/Drawer.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  height: 130,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Bussiness PORTAL",
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
                    mainAxisSpacing: 60,
                    crossAxisCount: 2,
                    children: <Widget>[
                      InkWell(
                        onTap:  (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => SelectBussinessWidget()));
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Image.asset('assets/images/download(1).png',height: 120,),
                              Icon(Icons.add,size: 120,color: Colors.green,),
                              Text('Register Bussiness'),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (BuildContext context) => HomePageWidget()));
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Image.asset('assets/images/download.png',height: 120,),
                              Icon(Icons.app_registration,size: 120,color: Colors.green,),
                              Text('Applied Bussiness'),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (BuildContext context) => TourGuidePageWidget()
                          // )
                          // );
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Image.asset('assets/images/tourguide.png',height: 120,),
                              Icon(Icons.add_chart,size: 120,color: Colors.green,),
                              Text('States'),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('assets/images/stats.jpg',height: 120,),
                              Text('View Statistics'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}