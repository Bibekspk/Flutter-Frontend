// import 'package:flutter_login_signup/models/searchModel.dart';
import 'package:flutter_login_signup/models/userModel.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static const String url = 'http://10.0.2.2:5000/api/getUserInfo';

  static Future<List<UserData>> getUserInfo() async {
    int userid = await FlutterSession().get("id");
    try {
      final response = await http.get(url + "/$userid");
      if (response.statusCode == 200) {
        // print(response.body);
        final body = response.body;
        // print(body.length);
        final users = infofromJson(body);
        List<UserData> user = users.data;
        // List property = properties.data.toString();
        // print(property[0].propertyAddress);
        return user;
      } else {
        print('Khali cha hai');
        return List<UserData>();
      }
    } catch (e) {
      return List<UserData>();
    }
  }
}
