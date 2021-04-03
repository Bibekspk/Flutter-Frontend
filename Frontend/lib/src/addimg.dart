// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class Imgpicker extends StatefulWidget {
//   @override
//   _ImgpickerState createState() => _ImgpickerState();
// }

// class _ImgpickerState extends State<Imgpicker> {
//   File _image;

//   Future getCamera() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.camera);

//     setState(() {
//       _image = image;
//     });
//   }

//   Future getGallery() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       _image = image;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Picker Example'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(
//               Icons.image,
//             ),
//             onPressed: getGallery,
//           ),
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed: () {
//               setState(() {
//                 _image = null;
//               });
//             },
//           )
//         ],
//       ),
//       body: Center(
//         child: _image == null ? Text('Nothing to show.') : Image.file(_image),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: getCamera,
//         child: Icon(Icons.camera_alt),
//       ),
//     );
//   }
// }
