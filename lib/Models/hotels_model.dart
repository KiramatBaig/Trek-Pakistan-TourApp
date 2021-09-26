class HotelModel{
  String title;
  String description;
  int price;
  String rating;


  HotelModel({this.title,this.description,this.price,this.rating});

  //receive data from server
  factory HotelModel.fromMap(map){
    return HotelModel(
      title: map['title'],
      description: map['description'],
      price: map['price'],
      rating: map['rating'],
    );
  }


}