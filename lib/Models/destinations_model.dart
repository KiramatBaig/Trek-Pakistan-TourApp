

import 'package:cloud_firestore/cloud_firestore.dart';


class Destination{
  final String name;
  final String description;
  final GeoPoint location;
  final String rating;
  Destination({this.name,this.description,this.location,this.rating});

  //getting data from server
  factory Destination.fromMap(map){
    return Destination(
      name: map['name'],
      description: map['description'],
      location: map['location'],
      rating: map['rating'],

    );
  }

  //sending data to our server
  Map<String ,dynamic> toMap(){
    return{
      'name':name,
      'description':description,
      'location':location,
      'rating':rating
    };
  }
}
