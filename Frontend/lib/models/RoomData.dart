class RoomData {
  List<Data> data;

  RoomData({this.data});

  RoomData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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
      this.images});

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
    images = json['images'].cast<String>();
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
    data['images'] = this.images;
    return data;
  }
}
