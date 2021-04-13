import 'package:flutter/material.dart';
// import 'package:flutter_login_signup/src/addRoom.dart';
import 'package:flutter_login_signup/src/components/room_carosuel.dart';
import 'package:flutter_login_signup/src/components/searchfilter.dart';
// import 'package:flutter_login_signup/src/addimg.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_login_signup/src/components/viewImg.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Body> {
  var images = FlutterSession().get('imagename');

  Future allRooms() async {
    var url = "http://10.0.2.2:5000/v1/getRoomDetail";
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    allRooms();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
        height: size.height * 0.2, //covers 20 percent
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Welcome, ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21),
                      ),
                      FutureBuilder(
                          future: FlutterSession().get('name'),
                          builder: (context, snapshot) {
                            return Text(
                                snapshot.hasData ? snapshot.data : "Loading",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 21));
                          }),
                      Spacer(),
                      IconButton(
                        padding: EdgeInsets.fromLTRB(0, 0, 35, 0),
                        icon: Icon(
                          Icons.person_sharp,
                          size: 40,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )),
              Positioned(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(10, 60, 10, 0),
                  height: 54,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Colors.white.withOpacity(0.23),
                        )
                      ]),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FilterPage()));
                          },
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        child: SingleChildScrollView(
          child: PropertyCarousel(),
        ),
      ),
    ]));
    // 'localhost:5000/v2/getimg/1617095763881.jpg'
    // http://10.0.2.2:5000/v2/getimg/1617095763881.jpg/
  }
}
