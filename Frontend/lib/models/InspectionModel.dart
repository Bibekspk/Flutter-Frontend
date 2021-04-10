class Inspection {
  String sitevisit;
  String roomPrice;
  // String username;
  // String email;
  String date;
  String inquiry;

  // String xyz;
  Inspection(
      {this.sitevisit,
      this.roomPrice,
      // this.username,
      // this.email,
      this.inquiry,
      this.date});
  // factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);

  _$ModelToJson(Inspection instance) => <String, dynamic>{
        'siteVisit': instance.sitevisit,
        'roomPrice': instance.roomPrice,
        // 'address': instance.username,
        // 'price': instance.email,
        'date': instance.date,
        'inquiry': instance.inquiry,
      };
}

// class RoomResponseModel {
//   final String roomid;
//   final bool success;
//   final String error;

//   RoomResponseModel({this.roomid, this.success, this.error});

//   factory RoomResponseModel.fromJson(Map<String, dynamic> json) {
//     return RoomResponseModel(
//       roomid: json["roomid"] != null ? json["roomid"] : "",
//       success: json["success"] != null ? json["success"] : "",
//       error: json["message"] != null ? json["message"] : "",
//     );
//   }
// }
