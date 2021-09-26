
import 'package:cloud_firestore/cloud_firestore.dart';


class HotelDBService{
  HotelDBService(this.destination);
  final CollectionReference HotelCollection= FirebaseFirestore.instance.collection('hotels');
  String destination;
  //Destination List from Snapshot
  Future getHotelList() async {
    List HotelList=[];
    try{
      await HotelCollection.where("destinationName",isEqualTo: destination).snapshots().listen((querySnapshots) {
        querySnapshots.docs.forEach((element) {
          HotelList.add(element.data());
        });
      });
      return HotelList;
    }catch(e){
      print(e.toString());
      return null;
    }

  }
  
}