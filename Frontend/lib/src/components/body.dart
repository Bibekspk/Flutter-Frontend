import 'package:flutter/material.dart';
// import 'package:flutter_login_signup/models/searchModel.dart';
import 'package:flutter_login_signup/src/components/room_carosuel.dart';
// import 'package:flutter_login_signup/src/components/savedRooms.dart';
import 'package:flutter_login_signup/src/components/searchedRoom.dart';
// import 'package:flutter_login_signup/src/components/savedRooms.dart';
import 'package:flutter_login_signup/src/components/searchfilter.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  String startPrice;
  String endPrice;
  Body({Key key, this.startPrice, this.endPrice}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Body> {
  // Search searchmodel = new Search();
  TextEditingController search = TextEditingController();
  var images = FlutterSession().get('imagename');
  var startRange;
  var endRange;
  Future allRooms() async {
    var url = "http://10.0.2.2:5000/v1/getRoomDetail";
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      startRange = widget.startPrice;
      endRange = widget.endPrice;
    });
    allRooms();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
        height: size.height * 0.27, //covers 20 percent
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
                  margin: EdgeInsets.fromLTRB(15, 60, 10, 0),
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
                  child: TextFormField(
                    controller: search,
                    style: TextStyle(fontSize: 21),
                    decoration: InputDecoration(
                        // labelText: "   Search",
                        hintText: "Search",
                        contentPadding: EdgeInsets.fromLTRB(7, 7.5, 0, 0),
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 22.5,
                            fontWeight: FontWeight.bold),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            print("Search " + search.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchedRooms(
                                          search: search.text,
                                          startPrice: startRange,
                                          endPrice: endRange,
                                        )));
                          },
                        )),
                  ),
                ),
              ),
              Container(
                  height: 55,
                  // width: 100,
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  margin: EdgeInsets.fromLTRB(285, 123, 5, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: RaisedButton(
                      textColor: Colors.black,
                      color: Colors.blue,
                      child: Text(
                        'Filter',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FilterPage()));
                      })),
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
