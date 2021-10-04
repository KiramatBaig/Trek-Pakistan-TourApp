class tourguideModel{
  String name;
  String detail;
  int fee;
  String rating;
  String location;
  String image;
  String contact;
  tourguideModel({this.image,this.name,this.detail,this.fee,this.rating,this.location,this.contact});

  //receive data from server
  factory tourguideModel.fromMap(map){
    return tourguideModel(
        name: map['name'],
        detail: map['detail'],
        fee: map['fee'],
        rating: map['rating'],
        location: map['destinationName'],
        image: map['image'],
        contact: map['contact']
    );
  }


}