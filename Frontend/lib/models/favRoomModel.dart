import 'dart:convert';

FavRooms favroomFromJson(String str) => FavRooms.fromJson(json.decode(str));

String roomToJson(FavRooms data) => json.encode(data.toJson());

class FavRooms {
  List<FavData> data;

  FavRooms({this.data});

  factory FavRooms.fromJson(Map<String, dynamic> json) => FavRooms(
        data: List<FavData>.from(json["data"].map((x) => FavData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
  // FavRooms.fromJson(Map<String, dynamic> json) {
  //   if (json['data'] != null) {
  //     data = new List<Data>();
  //     json['data'].forEach((v) {
  //       data.add(new Data.fromJson(v));
  //     });
  //   }
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data['data'] = this.data.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class FavData {
  int roomId;
  int userId;
  String roomTitle;
  int roomno;
  String description;
  String address;
  String price;
  String parking;
  String bathroom;
  // ignore: non_constant_identifier_names
  String Latitude;
  // ignore: non_constant_identifier_names
  String Longitude;
  String thumbImg;
  UserDetails userDetails;

  FavData(
      {this.roomId,
      this.userId,
      this.roomTitle,
      this.roomno,
      this.description,
      this.address,
      this.price,
      this.parking,
      this.bathroom,
      // ignore: non_constant_identifier_names
      this.Latitude,
      // ignore: non_constant_identifier_names
      this.Longitude,
      this.thumbImg,
      this.userDetails});

  FavData.fromJson(Map<String, dynamic> json) {
    roomId = json['RoomId'];
    userId = json['userId'];
    roomTitle = json['roomTitle'];
    roomno = json['roomno'];
    description = json['description'];
    address = json['address'];
    price = json['price'];
    parking = json['parking'];
    bathroom = json['bathroom'];
    Latitude = json['Latitude'];
    Longitude = json['Longitude'];
    thumbImg = json['thumb_Img'];
    userDetails = json['userDetails'] != null
        ? new UserDetails.fromJson(json['userDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RoomId'] = this.roomId;
    data['userId'] = this.userId;
    data['roomTitle'] = this.roomTitle;
    data['roomno'] = this.roomno;
    data['description'] = this.description;
    data['address'] = this.address;
    data['price'] = this.price;
    data['parking'] = this.parking;
    data['bathroom'] = this.bathroom;
    data['Latitude'] = this.Latitude;
    data['Longitude'] = this.Longitude;
    data['thumb_Img'] = this.thumbImg;
    if (this.userDetails != null) {
      data['userDetails'] = this.userDetails.toJson();
    }
    return data;
  }
}

class UserDetails {
  int id;
  String name;
  String email;
  String contact;
  String password;
  String address;
  int isAdmin;

  UserDetails(
      {this.id,
      this.name,
      this.email,
      this.contact,
      this.password,
      this.address,
      this.isAdmin});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    password = json['password'];
    address = json['address'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['password'] = this.password;
    data['address'] = this.address;
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}
