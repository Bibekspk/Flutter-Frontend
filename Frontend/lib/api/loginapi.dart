import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/loginmodel.dart';

class APIService {
  Future<LoginResponseModel> login(Model requestModel) async {
    String url = "http://10.0.2.2:5000/api/login";

    final response = await http.post(url,
        headers: {"Content-type": "application/json"},
        body: json.encode(requestModel.toJson()));
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(response.body);
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
