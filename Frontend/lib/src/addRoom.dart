import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/components/map.dart';
import 'package:flutter_login_signup/src/homepage.dart';
import 'package:flutter_login_signup/api/addRoomapi.dart';
import 'package:flutter_login_signup/models/addRoomodel.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class Roompage extends StatefulWidget {
  @override
  _AddRoomPageState createState() => _AddRoomPageState();
}

class _AddRoomPageState extends State<Roompage> {
  TextEditingController roomtitle = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController roomno = TextEditingController();
  TextEditingController latitude = TextEditingController();
  TextEditingController longitude = TextEditingController();

  AddRoom addroommodel = AddRoom();
  var session = FlutterSession(); // create session instance
  List<Asset> images = [];
  // List<Asset> mainimage = [];

  Dio dio = Dio();

  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String parking;
  String bathroom;

  File mainimage;
  final picker = ImagePicker();

  Future getImage() async {
    var pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        mainimage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  // Future<bool> checkAndRequestCameraPermissions() async {
  //   PermissionStatus permission = await PermissionHandler()
  //       .checkPermissionStatus(PermissionGroup.location);
  //   if (permission != PermissionStatus.granted) {
  //     Map<PermissionGroup, PermissionStatus> permissions =
  //         await PermissionHandler()
  //             .requestPermissions([PermissionGroup.location]);
  //     return permissions[PermissionGroup.location] == PermissionStatus.granted;
  //   } else {
  //     return true;
  //   }
  // }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  // Widget buildGridView1() {
  //   return GridView.count(
  //     crossAxisCount: 3,
  //     crossAxisSpacing: 10,
  //     children: List.generate(mainimage.length, (index) {
  //       Asset asset = mainimage[index];
  //       return AssetThumb(
  //         asset: asset,
  //         width: 300,
  //         height: 300,
  //       );
  //     }),
  //   );
  // }

  Future<void> loadAssets() async {
    List<Asset> resultList = [];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 5,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Select Photos",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      print(images);
    });
  }

  // Future<void> loadoneImg() async {
  //   List<Asset> oneList = [];

  //   try {
  //     oneList = await MultiImagePicker.pickImages(
  //       maxImages: 1,
  //       enableCamera: true,
  //       selectedAssets: mainimage,
  //       cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
  //       materialOptions: MaterialOptions(
  //         actionBarColor: "#abcdef",
  //         actionBarTitle: "Select Photos",
  //         allViewTitle: "All Photos",
  //         useDetailsView: false,
  //         selectCircleStrokeColor: "#000000",
  //       ),
  //     );
  //   } on Exception catch (e) {
  //     print(e.toString());
  //   }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;

  //   setState(() {
  //     mainimage = oneList;
  //     print("main images");
  //     print(mainimage);
  //   });
  // }

  // // @override
  // // void intitState() {
  // //   super.initState();

  // //   //For easy loading (can be removed mark *)
  // //   EasyLoading.addStatusCallback((status) {
  // //     print('EasyLoading Status $status');
  // //     if (status == EasyLoadingStatus.dismiss) {
  // //       _timer?.cancel();
  // //     }
  // //   });
  // //   //EasyLoading.showSuccess('Use in initState');
  // // }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(backgroundColor: Color.fromRGBO(13, 71, 161, 1)),
      body: Form(
          key: globalFormKey,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromRGBO(245, 124, 0, 1),
                  Color.fromRGBO(13, 71, 161, 1)
                ])),
            child: ListView(children: <Widget>[
              Image.asset(
                'assets/logo.PNG',
                height: 105,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'ADD ROOM',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(fontSize: 19),
                  controller: roomtitle,
                  keyboardType: TextInputType.text,
                  validator: (input) =>
                      !(input.length > 2) ? "Plese provide valid title" : null,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Room Title',
                      labelStyle:
                          TextStyle(fontSize: 19.0, color: Colors.black),
                      errorStyle:
                          TextStyle(fontSize: 16.0, color: Colors.white),
                      fillColor: Color(0x00000000),
                      filled: true),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(fontSize: 19),
                  controller: description,
                  keyboardType: TextInputType.text,
                  validator: (input) => !(input.length > 2)
                      ? "Plese provide valid description"
                      : null,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Description',
                      labelStyle:
                          TextStyle(fontSize: 19.0, color: Colors.black),
                      errorStyle:
                          TextStyle(fontSize: 16.0, color: Colors.white),
                      fillColor: Color(0x00000000),
                      filled: true),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(fontSize: 19),
                  controller: address,
                  keyboardType: TextInputType.text,
                  validator: (input) => !(input.length > 2)
                      ? "Plese provide valid address"
                      : null,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Address',
                      labelStyle:
                          TextStyle(fontSize: 19.0, color: Colors.black),
                      errorStyle:
                          TextStyle(fontSize: 16.0, color: Colors.white),
                      fillColor: Color(0x00000000),
                      filled: true),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Location",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        FlatButton(
                          height: 54,
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(color: Colors.blueGrey[500])),
                          color: Colors.blueGrey[500],
                          child: Text(" Pick Location ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 21)),
                          onPressed: () async {
                            print("Open Google map");
                            final info = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MapsGoogle()));
                            print(info.latitude.toString());
                            setState(() {
                              latitude = info.latitude.toString()
                                  as TextEditingController;
                              longitude = info.longitude.toString()
                                  as TextEditingController;
                              print("asdfsadf" + latitude.text);
                              print("saasdf" + longitude.text);
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(fontSize: 19),
                  controller: roomno,
                  keyboardType: TextInputType.number,
                  validator: (input) => !(input.length > 2)
                      ? "Plese provide valid room number"
                      : null,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Number of Rooms',
                      labelStyle:
                          TextStyle(fontSize: 19.0, color: Colors.black),
                      errorStyle:
                          TextStyle(fontSize: 16.0, color: Colors.white),
                      fillColor: Color(0x00000000),
                      filled: true),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  // obscureText: true,
                  style: TextStyle(fontSize: 17.5),
                  controller: price,
                  keyboardType: TextInputType.number,
                  validator: (input) => (input.isEmpty &&
                          input.contains(new RegExp('[A-Z][a-z]')))
                      ? "Plese provide valid room price"
                      : null,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Price',
                      labelStyle:
                          TextStyle(fontSize: 19.0, color: Colors.black),
                      errorStyle:
                          TextStyle(fontSize: 16.0, color: Colors.white),
                      fillColor: Color(0x00000000),
                      filled: true),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Select Main Image for Room',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: IconButton(
                  alignment: Alignment.topLeft,
                  focusColor: Colors.blue,
                  iconSize: 50,
                  splashColor: Colors.white,
                  icon: Icon(Icons.add_a_photo, color: Colors.blue, size: 50),
                  onPressed: () {
                    // takePhoto(ImageSource.gallery);
                    // loadoneImg();
                    getImage();
                    print(mainimage);
                    print("main img above ");
                  },
                ),
              ),
              // SizedBox(height: 1),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(50, 0, 50, 50),
                // width: 250,
                child: mainimage == null
                    ? Text('No image selected.')
                    : Image.file(mainimage),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Select Images',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: IconButton(
                  alignment: Alignment.topLeft,
                  focusColor: Colors.blue,
                  iconSize: 50,
                  splashColor: Colors.white,
                  icon: Icon(Icons.add_a_photo, color: Colors.blue, size: 50),
                  onPressed: () {
                    // takePhoto(ImageSource.gallery);
                    loadAssets();
                    // print(images);
                  },
                ),
              ),
              Container(
                height: 150,
                child: buildGridView(),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Parking',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Row(
                  children: <Widget>[
                    Radio(
                        value: "Available",
                        groupValue: parking,
                        activeColor: Colors.blue,
                        onChanged: (T) {
                          print(T);
                          setState(() {
                            parking = T;
                          });
                        }),
                    Text(
                      'Available',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Radio(
                      value: 'Unavailable',
                      groupValue: parking,
                      onChanged: (T) {
                        print(T);
                        setState(() {
                          parking = T;
                        });
                      },
                    ),
                    Text(
                      'Unavailable',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Attached Bathroom',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Row(
                  children: <Widget>[
                    Radio(
                        value: 'Available',
                        groupValue: bathroom,
                        activeColor: Colors.blue,
                        onChanged: (T) {
                          print(T);
                          setState(() {
                            bathroom = T;
                          });
                          print(bathroom);
                        }),
                    Text(
                      'Available',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Radio(
                      value: 'Unavailable',
                      groupValue: bathroom,
                      onChanged: (T) {
                        print(T);
                        setState(() {
                          bathroom = T;
                        });
                      },
                    ),
                    Text(
                      'Unavailable',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: RaisedButton(
                      textColor: Colors.white,
                      color: Color.fromRGBO(239, 108, 0, 0.9),
                      child: Text(
                        'Add Room',
                        style: TextStyle(fontSize: 23),
                      ),
                      onPressed: () async {
                        if (validate()) {
                          RoomAPIService apiService = new RoomAPIService();
                          apiService.addroom(addroommodel).then((value) {
                            if (value != null) {
                              if (value.success) {
                                session.set("roomid", value.roomid);
                                singleUpload();
                                sendImg();
                              } else {
                                session.set("message", value.error);
                                print("Error" + value.error);
                                EasyLoading.showError("Please provide values");
                              }
                            }
                          });
                        } else {
                          EasyLoading.showError(
                              'Please provide all the values');
                        }
                        print(bathroom);
                        print("main imageafter");
                        print(mainimage);
                      })),
            ]),
          )),
    );
  }

  void sendregdata() async {
    addroommodel = AddRoom(
      roomTitle: roomtitle.text,
      description: description.text,
      address: address.text,
      price: price.text,
      roomno: roomno.text,
      parking: parking,
      bathroom: bathroom,
      latitude: latitude.text,
      longitude: longitude.text,
    );
  }

  bool validate() {
    final form = globalFormKey.currentState;
    //If form is valid then it returns true
    if (form.validate()) {
      sendregdata();
      return true;
    }
    return false;
  }

  Future singleUpload() async {
    String filename = mainimage.path.split('/').last;
    try {
      FormData formData = new FormData.fromMap({
        "image": await MultipartFile.fromFile(mainimage.path,
            filename: filename, contentType: new MediaType('image', 'png')),
      });
      int roomId = await FlutterSession().get("roomid");
      String token = await FlutterSession().get("token");
      // Dio dio = new Dio();
      var response =
          await dio.post("http://10.0.2.2:5000/v2/singleupload/$roomId",
              data: formData,
              options: Options(
                headers: {"authorization": "$token"},
              ));
      if (response.statusCode == 200) {
        EasyLoading.showSuccess('Room Thumbnail is sucessfully Stored!');
        print(response.data);
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

  sendImg() async {
    if (validate()) {
      if (images != null) {
        // int i = 0;
        for (var i = 0; i < images.length; i++) {
          ByteData byteData = await images[i].getByteData();
          List<int> imageData = byteData.buffer.asUint8List();

          MultipartFile multipartFile = MultipartFile.fromBytes(
            imageData,
            filename: images[i].name,
            contentType: MediaType('image', 'jpg'),
          );

          FormData formData = FormData.fromMap({"image": multipartFile});
          // EasyLoading.show(status: 'Uploading Image...');

          //Image post

          //getting token from flutter session.
          //getting token from flutter session.
          String token = await FlutterSession().get("token");
          int userId = await FlutterSession().get("id");
          int roomId = await FlutterSession().get("roomid");
          // int roomid = int.parse(roomId);
          Dio dio = new Dio();
          var response = await dio.post(
              "http://10.0.2.2:5000/v2/$userId/$roomId/multipleuploads",
              data: formData,
              options: Options(
                headers: {"authorization": "$token"},
              ));
          if (response.statusCode == 200 || response.statusCode == 201) {
            print(response.data);
            EasyLoading.showSuccess("Successfully added");
          } else {
            return EasyLoading.show(status: 'Could not store in the system!');
          }
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      } else {
        print("Error occured");
      }
    } else {
      String message = await FlutterSession().get("error");
      EasyLoading.showError(message);
    }
  }
}
