class PrePlannedTripModel{
  String days;
  String description;
  String fromLocation;
  String host;
  String pickupLocation;
  String image;
  String toLocation;
  String priceperhead;
  String seats;
  PrePlannedTripModel({this.description,this.image,this.days,this.fromLocation,this.host,this.pickupLocation,this.priceperhead,this.seats,this.toLocation});

  //receive data from server
  factory PrePlannedTripModel.fromMap(map){
    return PrePlannedTripModel(
        days: map['days'],
        description: map['description'],
        fromLocation: map['fromLocation'],
        host: map['host'],
        pickupLocation: map['pickupLocation'],
        image: map['image'],
        toLocation: map['toLocation'],
        seats: map['seats'],
        priceperhead: map['priceperhead']
    );
  }


}