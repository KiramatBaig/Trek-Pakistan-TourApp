import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Admin%20Portal/AdminScreens/AdminProfileScreen.dart';
import 'package:flutter_auth/Screens/Profile_Edit/settings.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
class FrostedDrawer extends StatelessWidget {
  const FrostedDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
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
                              return AdminProfileWidget();
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

class ContactUsDialog extends StatelessWidget {
  final String title,description;

  ContactUsDialog({
    this.title, this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),

      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
  dialogContent(BuildContext context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 100,
            left: 16,
            bottom: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 16),

          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17.0),
              boxShadow:[
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10.0,
                  offset: Offset(0.0,10.0),
                )
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 16.0,),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16.0,

                ),

              ),
              SizedBox(height: 24.0,),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Close"),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 25,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: Colors.greenAccent,
            radius: 30,

          ),
        )
      ],
    );
  }

}
