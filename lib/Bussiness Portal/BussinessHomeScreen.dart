import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_auth/Bussiness%20Portal/SelectBussiness.dart';
import 'package:flutter_auth/Models/user_model.dart';


class BusinessHomeScreen extends StatefulWidget {
  @override
  _BusinessHomeScreenState createState() => _BusinessHomeScreenState();
}

class _BusinessHomeScreenState extends State<BusinessHomeScreen> {
  @override
  final auth = FirebaseAuth.instance;
  User user= FirebaseAuth.instance.currentUser;
  UserModel loggedInUser=UserModel();


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

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("${user.displayName}",
        style: TextStyle(
        color: Colors.black,

        ),),
              accountEmail: new Text("${user.email}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),

              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL),
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

                onTap: () {

                  // final provider=Provider.of<GoogleSignInProvider>(context,listen: false);
                  // provider.logout().then((value) => {
                  //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  //       BusinessLoginScreen()), (Route<dynamic> route) => false),
                  // });
                },
              leading: Icon(Icons.power_settings_new),
              title: new Text("Logout"),),
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
                        "BUSINESS PORTAL",
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
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap:  (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => SelectBussinessWidget()));
                        },
                        child: Container(
                          width: 500,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  // Image.asset('assets/images/download(1).png',height: 120,),
                                  Icon(Icons.cloud_done_rounded,size: 150,color: Colors.green,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,0,0,10),
                                    child: Text('REGISTER BUSINESS',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 500,
                        child: Padding(
                            padding: EdgeInsets.all(20.0),
                        child: InkWell(
                          onTap:  (){
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (BuildContext context) => DocPicker()));
                          },
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // Image.asset('assets/images/download(1).png',height: 120,),
                                Icon(Icons.upload_file,size: 150,color: Colors.green,),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,0,0,20),
                                  child: Text('UPLOAD DOCUMENTS',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),),
                                ),
                              ],
                            ),
                          ),
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