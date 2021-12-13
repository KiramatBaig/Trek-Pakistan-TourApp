class DestinationModel{
  String name;
  String description;
  String Image;
  String rating;
  List<String> Category;
  DestinationModel({this.description,this.Image,this.name,this.rating,this.Category});

  //receive data from server
  factory DestinationModel.fromMap(map){
    return DestinationModel(
        rating: map['rating'.toString()],
        description: map['description'],
        name: map['name'],
      Image: map['Image'],
      Category: map['Category'],
    );
  }


}