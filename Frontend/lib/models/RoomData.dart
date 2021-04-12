// To parse this JSON data, do
//
//     final property = propertyFromJson(jsonString);

import 'dart:convert';

RoomData roomFromJson(String str) => RoomData.fromJson(json.decode(str));

String roomToJson(RoomData data) => json.encode(data.toJson());

class RoomData {
  List<Data> data;

  RoomData({this.data});
  factory RoomData.fromJson(Map<String, dynamic> json) => RoomData(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
  // RoomData.fromJson(Map<String, dynamic> json) {
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
}
// }

class Data {
  int roomId;
  int userId;
  String roomTitle;
  int roomno;
  String description;
  String address;
  String price;
  String parking;
  String bathroom;
  String thumbImg;
  List<String> images;
  UserDetail userDetail;
  String favStatus;

  Data(
      {this.roomId,
      this.userId,
      this.roomTitle,
      this.roomno,
      this.description,
      this.address,
      this.price,
      this.parking,
      this.bathroom,
      this.thumbImg,
      this.images,
      this.favStatus,
      this.userDetail});

  Data.fromJson(Map<String, dynamic> json) {
    roomId = json['RoomId'];
    userId = json['userId'];
    roomTitle = json['roomTitle'];
    roomno = json['roomno'];
    description = json['description'];
    address = json['address'];
    price = json['price'];
    parking = json['parking'];
    bathroom = json['bathroom'];
    thumbImg = json['thumb_Img'];
    favStatus = json['favStatus'];
    images = json['images'].cast<String>();
    userDetail = json['userDetail'] != null
        ? new UserDetail.fromJson(json['userDetail'])
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
    data['thumb_Img'] = this.thumbImg;
    data['favStatus'] = this.favStatus;
    data['images'] = this.images;
    if (this.userDetail != null) {
      data['userDetail'] = this.userDetail.toJson();
    }
    return data;
  }
}

class UserDetail {
  int id;
  String name;
  String email;
  String contact;
  String password;
  Null isAdmin;

  UserDetail(
      {this.id,
      this.name,
      this.email,
      this.contact,
      this.password,
      this.isAdmin});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    password = json['password'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['password'] = this.password;
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}
