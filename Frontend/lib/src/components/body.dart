import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/addRoom.dart';
import 'package:flutter_session/flutter_session.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height * 0.2, //covers 20 percent
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),

          child: Stack(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(15, 25, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Welcome user,  ",
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
                  margin: EdgeInsets.fromLTRB(10, 75, 10, 0),
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
                          onPressed: () {},
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          // focusColor: Colors.blue,
          iconSize: 50,
          // splashColor: Colors.white,
          icon: Icon(Icons.add_circle, color: Colors.blue, size: 50),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Roompage()));
          },
        ),
      ],
    );
  }
}
