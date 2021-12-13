import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/sentimentalModule/userMod/DestiBuild.dart';


class UserSentinments extends StatefulWidget {
  UserSentinments({Key key}) : super(key: key);

  @override
  _UserSentinmentsState createState() => _UserSentinmentsState();
}

class _UserSentinmentsState extends State<UserSentinments> {
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _chosenValue;
  String _chosenValue2;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
  }
  String query;

  makeList(String a, String b, String c,String interest1, interest2){
    if (a?.isNotEmpty ?? true && b?.isNotEmpty ?? true && b?.isNotEmpty ?? true) {
      print("a and b are not null");
      List<String> list = [];
      list.add(a);
      list.add(b);

      Timer(
          Duration(seconds: 1),
      () =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => Destibuld(a, b, c ,interest1, interest2))));
    }
    else
      {
        print("either a or b is null");
      }
    // if(a!=null) {
    //   if(b!=null){
    //   List<String> list = [];
    //   list.add(a);
    //   list.add(b);
    // }}

  }

  @override
  Widget build(BuildContext context) {
    String _budget;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFECF0ED),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFF66BB6A),
            size: 30,
          ),
          iconSize: 30,
        ),
        title: Text(
          'Trek Pakistan',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFF66BB6A),
          ),
        ),

        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Color(0xFFF5F5F5),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: AutoSizeText(
                    'Tour Recommender',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 2),
                    child: Container(
                      //width: 100px,
                      width: 500,
                      height: 200,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                      child: Image.asset(
                        'assets/images/AI.jpeg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
                  child: Text(
                    'Fill all the field to Proceed',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF8D8181),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: Alignment(0, 0),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Icon(
                                    Icons.monetization_on,
                                    color: Color(0xFF66BB6A),
                                    size: 24,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, 0),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment(-0.4, -0.5),
                                        child: Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(5, 15, 5, 0),
                                          child: Text(
                                            'Enter your Budget :',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: TextFormField(
                                    controller: textController1,
                                    obscureText: false,
                                    validator: (value) =>
                                    value.isEmpty ? 'budget cannot be blank' : null,
                                    onSaved: (value) => _budget = value,
                                    decoration: InputDecoration(
                                      hintText: '25000',
                                      hintStyle:
                                      TextStyle(
                                        fontFamily: 'Poppins',
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8D8181),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF8D8181),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style:TextStyle(
                                      fontFamily: 'Poppins',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),


                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Container(
                        height: 100,
                        width: 500,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,

                          value: _chosenValue,
                          //elevation: 5,
                          style: TextStyle(color: Colors.black),

                          items: <String>[
                            'Mountain',
                            'River',
                            'Plain',
                            'Hill',
                            'Historic',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(

                              value: value,
                              child: Text(value),
                            );

                          }).toList(),
                          hint: Text(
                            "Please choose a Geography type",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          borderRadius: BorderRadius.circular(15),


                          onChanged: (String value) {
                            setState(() {
                              _chosenValue = value;
                            });
                          },

                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Container(
                        height: 100,
                        width: 500,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,

                          value: _chosenValue2,
                          //elevation: 5,
                          style: TextStyle(color: Colors.black),

                          items: <String>[
                            'Mountain',
                            'River',
                            'Plain',
                            'Hill',
                            'Historic',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(

                              value: value,
                              child: Text(value),
                            );

                          }).toList(),
                          hint: Text(
                            "Please choose one more Geography",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          borderRadius: BorderRadius.circular(15),

                          onChanged: (String value) {
                            setState(() {
                              _chosenValue2 = value;
                            });
                          },

                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Container(
                        height: 20,
                        width: 500,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),

                        child: Text("Enter Your Interests",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Container(
                        height: 150,
                        width: 500,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),

                        child: Column(
                          children: [
                            TextFormField(
                              controller: textController2,
                              obscureText: false,
                              validator: (value) =>
                              value.isEmpty ? 'budget cannot be blank' : null,
                              onSaved: (value) => _budget = value,
                              decoration: InputDecoration(
                                hintText: 'photography',
                                hintStyle:
                                TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF8D8181),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF8D8181),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style:TextStyle(
                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,
                            ),
                            TextFormField(
                              controller: textController3,
                              obscureText: false,
                              validator: (value) =>
                              value.isEmpty ? 'budget cannot be blank' : null,
                              onSaved: (value) => _budget = value,
                              decoration: InputDecoration(
                                hintText: 'BBQ',
                                hintStyle:
                                TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF8D8181),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF8D8181),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style:TextStyle(
                                fontFamily: 'Poppins',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: OutlineButton(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("CANCEL",
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 2.2,
                                    color: Colors.black)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: RaisedButton(
                            onPressed: () {
                              if(textController2.text.isNotEmpty && textController3.text.isNotEmpty) {
                                makeList(_chosenValue, _chosenValue2,
                                    textController1.text, textController2.text,
                                    textController3.text);
                              }
                              else{
                                return (Text("fill all blank"));
                              }
                            },
                            color: Colors.green,
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "NEXT",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),

                  ],
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}