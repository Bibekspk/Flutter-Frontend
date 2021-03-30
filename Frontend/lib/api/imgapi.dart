// import 'package:flutter_session/flutter_session.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../models/addRoomodel.dart';

// class ImageAPIService {
//   Future<ImgResponseModel> fetchAlbum() async {
//     int roomId = await FlutterSession().get('roomid');
//     String url = "http://10.0.2.2:5000/v2/getMultipleimg/$roomId";
//     final response = await http.get(
//       url,
//       headers: {"Content-type": "application/json"},
//     );

//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       return ImgResponseModel.fromJson(jsonDecode(response.body));
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load album');
//     }
//   }
// }
