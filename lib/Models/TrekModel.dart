class TrekModel{
  String city;
  String description;
  String Image;
  String startpoint;
  String endpoint;
  String provider;
  String trekname;
  String days;
  String Category;

  TrekModel({this.description,this.Image,this.trekname,this.days, this.startpoint,this.endpoint, this.city, this.Category,this.provider});

  //receive data from server
  factory TrekModel.fromMap(map){
    return TrekModel(
      description: map['description'],
      trekname: map['name'],
      Image: map['Image'],
      Category: map['Category'],
      endpoint: map['endpoint'],
      startpoint: map['startpoint'],
      days: map['days'],
      city: map['City'],
      provider: map['provider'],
    );
  }


}