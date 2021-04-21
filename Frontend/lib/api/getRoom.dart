// import 'package:flutter_login_signup/models/searchModel.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_login_signup/models/RoomData.dart';

class Services {
  static const String searchurl = 'http://10.0.2.2:5000/v1/searchedRoom';
  static const String listRoomUrl = 'http://10.0.2.2:5000/v1/getRooms';

  static Future<List<Datum>> getRoom() async {
    const String url = 'http://10.0.2.2:5000/v1/getRoomDetail';
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        final body = response.body;
        // print(body.length);
        final rooms = roomFromJson(body);
        List<Datum> room = rooms.data;
        // List property = properties.data.toString();
        print(room[0].address);
        return room;
      } else {
        print('Khali cha hai');
        return List<Datum>();
      }
    } catch (e) {
      return List<Datum>();
    }
  }

  static Future<List<Datum>> searchedRoom(
      String search, String start, String end) async {
    try {
      final response = await http.get(
        searchurl + "/$search/$start/$end",
        headers: {"Content-type": "application/json"},
      );
      print("Search in api" + search);
      if (response.statusCode == 200) {
        print(start);
        // print(response.body);
        final body = response.body;
        // print(body.length);
        final rooms = roomFromJson(body);
        List<Datum> room = rooms.data;
        // List property = properties.data.toString();
        // print(property[0].propertyAddress);
        return room;
      } else {
        print('Khali cha hai');
        return List<Datum>();
      }
    } catch (e) {
      return List<Datum>();
    }
  }

  static Future<List<Datum>> listedRoom() async {
    int userid = await FlutterSession().get("id");
    try {
      final response = await http.get(
        listRoomUrl + "/$userid",
        headers: {"Content-type": "application/json"},
      );
      if (response.statusCode == 200) {
        // print(response.body);
        final body = response.body;
        // print(body.length);
        final rooms = roomFromJson(body);
        List<Datum> room = rooms.data;
        // List property = properties.data.toString();
        // print(property[0].propertyAddress);
        return room;
      } else {
        return List<Datum>();
      }
    } catch (e) {
      return List<Datum>();
    }
  }
}
