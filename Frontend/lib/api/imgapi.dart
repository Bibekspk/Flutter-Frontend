// // import 'package:flutter_session/flutter_session.dart';
// import 'package:http/http.dart' as http;
// // import 'package:flutter_session/flutter_session.dart';

// dynamic token = FlutterSession.get('token');
// Future<http.StreamedResponse> patchImage(String url, String filepath) async {
//     // url = formater(url);
//     // String token = await storage.read(key: "token");
//     var request = http.MultipartRequest('PATCH', Uri.parse(url));
//     request.files.add(await http.MultipartFile.fromPath("img", filepath));
//     request.headers.addAll({
//       "Content-type": "multipart/form-data",
//       "Authorization":
//     });
//     var response = request.send();
//     return response;
//   }
