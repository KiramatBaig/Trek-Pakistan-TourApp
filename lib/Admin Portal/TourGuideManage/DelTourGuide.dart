import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/rectangular_button.dart';
import 'package:flutter_auth/Models/tourguideModel.dart';



class TourguideDel extends StatefulWidget {
  final String name;

  TourguideDel(this.name);
  @override
  _TourguideDelState createState() => _TourguideDelState();
}


class _TourguideDelState extends State<TourguideDel> {


  tourguideModel TourGuide= tourguideModel();




  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('TourGuide').where('name',isEqualTo: widget.name).get(),
        builder: (context, snap){
          if(snap.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            final list=snap.data.docs;
            return Stack(
              children: <Widget>[
                Container(
                    foregroundDecoration: BoxDecoration(
                        color: Colors.black26
                    ),
                    height: 400,
                    width: 400,
                    child: Image.network(list[0]['image'], fit: BoxFit.cover)),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 250),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:16.0),
                        child: Text(
                          "${list[0]['name']}",
                          style: TextStyle(color: Colors.green, fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10,),

                      Container(
                        padding: const EdgeInsets.all(32.0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              width: double.infinity,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                color: Colors.green,
                                textColor: Colors.white,
                                child: Text("Delete Tour Guide", style: TextStyle(
                                    fontWeight: FontWeight.normal
                                ),),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 32.0,
                                ),
                                onPressed: ()async {
                                  var collection = FirebaseFirestore.instance.collection('TourGuide');
                                  var querySnapshots = await collection.where('name',isEqualTo: widget.name).get();
                                  for (var snapshot in querySnapshots.docs) {
                                    print(snapshot.id);
                                    DocumentReference documentreference = FirebaseFirestore.instance.collection('TourGuide').doc(snapshot.id);
                                    documentreference.delete().whenComplete(() {
                                      print("document deleted");
                                    });

                                    final documentID = snapshot.id; // <-- Document ID
                                  }

                                },
                              ),
                            ),
                            Text("Detail",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            Divider(
                              color: Colors.black,
                              thickness: 1.0,
                              height: 1,
                            ),
                            SafeArea(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:5.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.8,
                                          child: RectangluarButton(color: Colors.lightBlueAccent.withOpacity(0.7) ,icon: Icon(Icons.event_seat),press: (){

                                          },text: ": ${list[0]['fee']}",),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.8,
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: RectangluarButton(color: Colors.lightBlueAccent.withOpacity(0.7),icon: Icon(Icons.location_on),press: (){},text: "Location: ${list[0]['location']}",),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    backgroundColor: Colors.green,
                    elevation: 0,


                  ),
                ),
              ],
            );
          }
        },

      ),
    );
  }
}