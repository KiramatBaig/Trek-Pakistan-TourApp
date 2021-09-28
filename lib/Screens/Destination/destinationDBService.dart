
import 'package:cloud_firestore/cloud_firestore.dart';


class destinationDBService{
  destinationDBService();
  final CollectionReference destinationCollection= FirebaseFirestore.instance.collection('destinations');


  //Destination List from Snapshot
  Future getDestinationList() async {
    List destinationList=[];
    try{
      await destinationCollection.get().then((querySnapshots) {
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
    return destinationCollection.snapshots();
  }
}