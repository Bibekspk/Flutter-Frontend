import 'package:http/http.dart' as http;
import 'package:flutter_login_signup/models/RoomData.dart';

class Services {
  static const String url = 'http://10.0.2.2:5000/v1/getRoomDetail';
  static const String searchurl = 'http://10.0.2.2:5000/v1/searchedRoom';

  static Future<List<Data>> getRoom() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // print(response.body);
        final body = response.body;
        // print(body.length);
        final rooms = roomFromJson(body);
        List<Data> room = rooms.data;
        // List property = properties.data.toString();
        // print(property[0].propertyAddress);
        return room;
      } else {
        print('Khali cha hai');
        // return List<Property>();
      }
    } catch (e) {
      return List<Data>();
    }
  }

  static Future<List<Data>> searchedRoom(
      String search, String start, String end) async {
    try {
      final response = await http.get(
        searchurl + "/$search/$start/$end",
        headers: {"Content-type": "application/json"},
      );
      if (response.statusCode == 200) {
        // print(response.body);
        final body = response.body;
        // print(body.length);
        final rooms = roomFromJson(body);
        List<Data> room = rooms.data;
        // List property = properties.data.toString();
        // print(property[0].propertyAddress);
        return room;
      } else {
        print('Khali cha hai');
        // return List<Property>();
      }
    } catch (e) {
      return List<Data>();
    }
  }
}
