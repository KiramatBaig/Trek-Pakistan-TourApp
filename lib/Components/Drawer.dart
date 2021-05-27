import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/MyMaps/ui/screens/details.dart';
import 'package:flutter_auth/Screens/MyMaps/ui/screens/home.dart';
import 'package:flutter_auth/Screens/Profile_Edit/edit_profile.dart';
import 'package:flutter_auth/Screens/Profile_Edit/settings.dart';
import 'package:flutter_auth/Screens/Weather/Weather_Screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
class FrostedDrawer extends StatelessWidget {
  const FrostedDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: double.infinity,
      decoration: BoxDecoration(
          color: Color.fromARGB(180, 250, 250, 250),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(31, 38, 135, 0.4),
              blurRadius: 8.0,
            )
          ],
          border: Border(
              right: BorderSide(
                color: Colors.white70,
              ))),
      child: Stack(
        children: [
          SizedBox(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4.0,
                  sigmaY: 4.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.grey.withOpacity(0.0),
                        Colors.green.withOpacity(0.8),
                      ])),
                ),
              ),
            ),
          ),
          Column(
            children: [
              DrawerHeader(
                child: Row(

                  children: [

                    CircleAvatar(
                      backgroundImage: NetworkImage("https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg"),
                      radius: 30.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text("User Name",)
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [

                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SettingsUI();
                            },
                          ),
                        );
                      },
                      leading: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      title: Text("Profile"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailsScreen();
                            },
                          ),
                        );
                      },
                      leading: Icon(
                        Icons.alt_route,
                        color: Colors.black,
                      ),
                      title: Text("Search Route"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SettingsPage();
                            },
                          ),
                        );
                      },
                      leading: Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                      title: Text("Settings"),
                    ),

                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SettingsPage();
                            },
                          ),
                        );
                      },
                      leading: Icon(
                        Icons.local_phone,
                        color: Colors.black,
                      ),
                      title: Text("Contact Us"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Weather();
                            },
                          ),
                        );
                      },
                      leading: Icon(
                        Icons.cloud,
                        color: Colors.black,
                      ),
                      title: Text("Weather"),
                    ),

                    ListTile(
                      onTap: () {

                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                            WelcomeScreen()), (Route<dynamic> route) => false);
                      },

                      leading: Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      title: Text("Log Out"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}