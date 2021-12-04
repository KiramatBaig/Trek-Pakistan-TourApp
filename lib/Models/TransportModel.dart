class TransportModel{
  String seats;
  String name;
  String location;


  TransportModel({this.location,this.seats,this.name});

  //receive data from server
  factory TransportModel.fromMap(map){
    return TransportModel(
      seats: map['seats'],
      name: map['name'],
      location: map['location'],
    );
  }


}