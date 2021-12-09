import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class addDestination extends StatelessWidget {
  final String name;
  final String location;
  final String description;


  addDestination(this.name, this.location, this.description);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference Destinations = FirebaseFirestore.instance.collection('Destinations');

    Future<void> addDestination() {
      // Call the user's CollectionReference to add a new user
      return Destinations
          .add({
        'name': name, // John Doe
        'location': location, // Stokes and Sons
        'description': description // 42
      })
          .then((value) => print("destination Added"))
          .catchError((error) => print("Failed to add destination: $error"));
    }

    return TextButton(
      onPressed: addDestination,
      child: Text(
        "Add Destination",
      ),
    );
  }
}