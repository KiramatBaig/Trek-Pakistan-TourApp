class HotelModel{
  String title;
  String description;
  int price;
  String rating;
  String location;
  String image;
  HotelModel({this.image,this.title,this.description,this.price,this.rating,this.location});

  //receive data from server
  factory HotelModel.fromMap(map){
    return HotelModel(
      title: map['title'],
      description: map['description'],
      price: map['price'],
      rating: map['rating'],
      location: map['destinationName'],
      image: map['image']
    );
  }


}