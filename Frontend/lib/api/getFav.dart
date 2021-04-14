import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_login_signup/models/favRoomModel.dart';

class ServicesFav {
  static const String url = "http://10.0.2.2:5000/v1/favRooms";

  // ignore: missing_return
  static Future<List<FavData>> getFavRoom() async {
    int userid = await FlutterSession().get("id");
    try {
      final response = await http.get(url + "/$userid");
      if (response.statusCode == 200) {
        print(response.body);
        final body = response.body;
        // print(body.length);
        final rooms = favroomFromJson(body);
        List<FavData> room = rooms.data;
        // List property = properties.data.toString();
        // print(property[0].propertyAddress);
        return room;
      } else {
        print('Empty');
        print(userid);
        // return List<Property>();
      }
    } catch (e) {
      return List<FavData>();
    }
  }
}
