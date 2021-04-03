class AddRoom {
  String roomTitle;
  String description;
  String address;
  String price;
  String roomno;
  String parking;
  String bathroom;

  // String xyz;
  AddRoom(
      {this.roomTitle,
      this.description,
      this.address,
      this.price,
      this.roomno,
      this.parking,
      this.bathroom});
  // factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);

  _$ModelToJson(AddRoom instance) => <String, dynamic>{
        'roomTitle': instance.roomTitle,
        'description': instance.description,
        'address': instance.address,
        'price': instance.price,
        'roomno': instance.roomno,
        'parking': instance.parking,
        'bathroom': instance.bathroom
      };
}

class RoomResponseModel {
  final String roomid;
  final bool success;
  final String error;

  RoomResponseModel({this.roomid, this.success, this.error});

  factory RoomResponseModel.fromJson(Map<String, dynamic> json) {
    return RoomResponseModel(
      roomid: json["roomid"] != null ? json["roomid"] : "",
      success: json["success"] != null ? json["success"] : "",
      error: json["message"] != null ? json["message"] : "",
    );
  }
}
