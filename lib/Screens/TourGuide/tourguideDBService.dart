
import 'package:cloud_firestore/cloud_firestore.dart';


class tourguideDBService{
  tourguideDBService();
  final CollectionReference TourGuideCollection= FirebaseFirestore.instance.collection('TourGuide');


  //Destination List from Snapshot
  Future gettourguideList() async {
    List destinationList=[];
    try{
      await TourGuideCollection.get().then((querySnapshots) {
        querySnapshots.docs.forEach((element) {
          destinationList.add(element.data());
        });
      });
      return destinationList;
    }catch(e){
      print(e.toString());
      return null;
    }

  }
  //get destination stream
  Stream<QuerySnapshot> get destinations{
    return TourGuideCollection.snapshots();
  }
}