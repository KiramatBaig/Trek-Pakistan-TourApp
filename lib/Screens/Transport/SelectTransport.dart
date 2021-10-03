
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/loading.dart';
import 'package:flutter_auth/Screens/Destination/Destination_List.dart';
import 'package:flutter_auth/Screens/Transport/TransportScreen2.dart';


class Transport extends StatelessWidget{
  final String location;
  Transport(this.location);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        title: const Text('Trek Pakistan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        titleSpacing: 50,

        backgroundColor: Colors.green,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('transports').where('location',isEqualTo: location).snapshots(),
        builder: buildTransport,
      )
    );
  }
  Widget buildTransport(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.connectionState==ConnectionState.waiting) {
      return Loading();
    }
    else if(snapshot.data.docs.isEmpty){
      return Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.green.withOpacity(0.3),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline),
                      Text("We are sorry",style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text("No Transport available for this location"),
                  TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>DestinationList() ));
                  }, child: Text("Choose another location"))
                ],
              ),
            ),
          ),
        ),
      );
    }
    else{
      return ListView.builder(
        itemCount: snapshot.data.docs.length,
        itemBuilder: (context, index) {
          DocumentSnapshot transport = snapshot.data.docs[index];

          return Container(
            padding: EdgeInsets.only(left: 20,right: 20,top: 10),

            child: ListTile(

              tileColor: Colors.green.withOpacity(0.3),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>Transport2() ));
              },
              // Access the fields as defined in FireStore
              title: Text(transport['name'],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
              leading: ImageIcon(AssetImage("assets/icons/public-transport.png")),

            ),
          );
        },
      );
    }

  }

}