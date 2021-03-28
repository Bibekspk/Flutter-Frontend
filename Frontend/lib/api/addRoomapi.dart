// import 'package:flutter_login_signup/src/addRoom.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/addRoomodel.dart';
import 'package:flutter_session/flutter_session.dart';

class RoomAPIService {
  Future<RoomResponseModel> login(AddRoom addroommodel) async {
    String userId = await FlutterSession().get("id");
    String url = "http://10.0.2.2:5000/v1/$userId/room";
    String token = await FlutterSession().get("token");
    final response = await http.post(url,
        headers: {
          "Content-type": "application/json",
          "Authorization": "$token"
        },
        body: json.encode(addroommodel.toJson()));
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(response.body);
      return RoomResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
