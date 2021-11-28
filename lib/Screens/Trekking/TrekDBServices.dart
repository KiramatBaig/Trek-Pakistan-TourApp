
import 'package:cloud_firestore/cloud_firestore.dart';


class trekDBService{
  trekDBService();
  final CollectionReference trekCollection= FirebaseFirestore.instance.collection('Trek');


  //Destination List from Snapshot
  Future getDestinationList() async {
    List destinationList=[];
    try{
      await trekCollection.get().then((querySnapshots) {
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
    return trekCollection.snapshots();
  }
}