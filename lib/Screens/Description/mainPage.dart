import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Description/detailsPage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              SizedBox(
                height: 40,
              ),
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage("assets/images/flag-iran.png"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Punjab")
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage("assets/images/flag-japan.png"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Sindh")
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage("assets/images/flag-qatar.png"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Gilgit Baltistan")
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage("assets/images/flag-england.png"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Khyber Pakhtoon")
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    height: 260,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsPage();
                              }),
                            );
                          },
                          child: Container(
                            width: 200,
                            margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 15),
                                  child: ClipRRect(
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("assets/images/islamabad2.jpg"),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 50,
                                      width: 50,
                                      margin: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFF4EE),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage("assets/images/char2.png"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("Islamabad, Capital"),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 15),
                                child: ClipRRect(
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/gilgit.jpg"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    width: 50,
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFF4EE),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/images/char1.png"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Hunza, GB"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Image(
                      fit: BoxFit.cover,
                      width: 20,
                      height: 20,
                      image: AssetImage("assets/images/star.png"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Suggestion For You",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(27),
                        topLeft: Radius.circular(27),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFF4EE),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/images/char2.png",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Kiramat's suggestion",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Image(
                                    image: AssetImage("assets/images/star.png"),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 0.3,
                          indent: 40,
                          endIndent: 40,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image(
                                    width: 50,
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/images/islamabad.jpg"),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Faisal Mosque",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFA1FF8F),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Islamabad, Capital",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Image(
                                  image: AssetImage(
                                    "assets/images/scan.png",
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 0.3,
                          indent: 40,
                          endIndent: 40,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image(
                                    width: 50,
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/images/shahjahan.jpg"),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "shah Jahan Mosque",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5BFFF),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "thatta, Sindh",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Image(
                                  image: AssetImage(
                                    "assets/images/scan.png",
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 0.3,
                          indent: 40,
                          endIndent: 40,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image(
                                    width: 50,
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/islamabad.jpg"),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "F9 Park",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFA1FF8F),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Islamabad, Capital",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Image(
                                  image: AssetImage(
                                    "assets/images/scan.png",
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      )),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/images/home.png"),
                        ),
                        Image(
                          image: AssetImage("assets/images/bulk.png"),
                        ),
                        Image(
                          image: AssetImage("assets/images/scan2.png"),
                        ),
                        Image(
                          image: AssetImage("assets/images/statistics.png"),
                        ),
                        Image(
                          image: AssetImage("assets/images/person.png"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
