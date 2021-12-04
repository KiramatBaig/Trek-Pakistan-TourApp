import 'package:dart_sentiment/dart_sentiment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/loading.dart';
import 'package:flutter_auth/Components/rounded_button.dart';
import 'package:flutter_auth/Screens/Destination/destinationDBService.dart';
import 'package:flutter_auth/Screens/Destination/detail_screen.dart';
import 'package:flutter_auth/Screens/HotelBooking/HotelScreen.dart';
import 'package:flutter_auth/Screens/HotelBooking/Hotel_Book.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class sentiScreen extends StatefulWidget {

  @override
  _sentiScreenState createState() => _sentiScreenState();
}

class _sentiScreenState extends State<sentiScreen> {
  @override


  void helloworld() {

    final sentiment = Sentiment();

    print(sentiment.analysis("The cake she made was terrible 😐"));

    print(sentiment.analysis("The cake she made was terrible 😐", emoji: true));

    print(sentiment.analysis("I love cats, but I am allergic to them.",));
    print(sentiment.analysis("I love cats and i want to marry them. love you, you are beautiful thanks much love",));


  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Trek Pakistan',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          centerTitle: true,
          elevation: 4,
          leading: IconButton(
            onPressed: () {
              helloworld();
             // Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          child:  Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Destinations",
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    color: Colors.green,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Divider(
              color: Colors.black,
              height: 10,
              indent: 20,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Popular Places',
                style: GoogleFonts.poppins(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ]),
        ));
  }
}
