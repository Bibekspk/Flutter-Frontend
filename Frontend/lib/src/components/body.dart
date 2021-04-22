import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_login_signup/src/components/room_carosuel.dart';
import 'package:flutter_login_signup/src/components/searchedRoom.dart';
import 'package:flutter_login_signup/src/components/searchfilter.dart';
import 'package:flutter_session/flutter_session.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

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
  // var images = FlutterSession().get('imagename');
  var startRange;
  var endRange;

  @override
  void initState() {
    super.initState();
    setState(() {
      startRange = widget.startPrice;
      endRange = widget.endPrice;
    });
    // allRooms();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(children: <Widget>[
      Container(
        height: size.height * 0.24, //covers 20 percent
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
        child: Stack(
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Welcome, ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    FutureBuilder(
                        future: FlutterSession().get('name'),
                        builder: (context, snapshot) {
                          return Text(
                              snapshot.hasData ? snapshot.data : "Loading",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 19));
                        }),
                    Spacer(),
                    IconButton(
                      padding: EdgeInsets.fromLTRB(0, 0, 35, 0),
                      icon: Icon(
                        Icons.person_sharp,
                        size: 35,
                      ),
                      onPressed: () {},
                    ),
                  ],
                )),
            Positioned(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(15, 40, 10, 0),
                height: 45,
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
                          if (widget.startPrice != null && search.text != "") {
                            print("Search Text" + search.text);
                            print(startRange);
                            print(endRange);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchedRooms(
                                          search: search.text,
                                          startPrice: startRange,
                                          endPrice: endRange,
                                        )));
                          } else {
                            EasyLoading.showInfo(
                                "Provide Range of Price for better search",
                                maskType: EasyLoadingMaskType.black);
                          }
                        },
                      )),
                ),
              ),
            ),
            Container(
                height: 35,
                // width: 100,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                margin: EdgeInsets.fromLTRB(240, 90, 5, 0),
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
      Container(
        child: PropertyCarousel(),
      ),
    ]);
    // 'localhost:5000/v2/getimg/1617095763881.jpg'
    // http://10.0.2.2:5000/v2/getimg/1617095763881.jpg/
  }
}
