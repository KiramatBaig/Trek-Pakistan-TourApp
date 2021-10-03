class UserModel{
  String uid;
  String email;
  String FullName;
  String Image;


  UserModel({this.uid,this.email,this.FullName,this.Image});

  //receive data from server
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      FullName: map['Name'],
      Image: map['Image'],
    );
  }

  //sending data to our server
  Map<String ,dynamic> toMap(){
    return{
      'uid':uid,
      'email':email,
      'Name':FullName,
      'Image':Image,
    };
  }
}