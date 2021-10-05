class tourguideModel{
  String name;
  String image;
  String detail;
  String fee;
  String rating;
  String destinationName;
  String contact;
  tourguideModel({this.name,this.image,this.detail,this.fee,this.rating,this.destinationName,this.contact});

  //receive data from server
  factory tourguideModel.fromMap(map){
    return tourguideModel(
        name: map['name'],
        image: map['image'],
        detail: map['detail'],
        fee: map['fee'],
        rating: map['rating'],
        destinationName: map['location'],
        contact: map['contact']
    );
  }


}