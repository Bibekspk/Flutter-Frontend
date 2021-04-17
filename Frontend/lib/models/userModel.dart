import 'dart:convert';

UserProfile infofromJson(String str) => UserProfile.fromJson(json.decode(str));

String infoToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  List<UserData> data;

  UserProfile({this.data});

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        data:
            List<UserData>.from(json["data"].map((x) => UserData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class UserData {
  int id;
  String name;
  String email;
  String contact;
  String password;
  String address;
  Null isAdmin;

  UserData(
      {this.id,
      this.name,
      this.email,
      this.contact,
      this.password,
      this.address,
      this.isAdmin});

  UserData.fromJson(Map<String, dynamic> json) {
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
