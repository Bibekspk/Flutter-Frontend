import 'package:flutter/material.dart';
import 'package:flutter_login_signup/api/getFav.dart';
// import 'package:flutter_login_signup/models/RoomData.dart';
import 'package:flutter_login_signup/models/favRoomModel.dart';
// import 'package:flutter_login_signup/src/components/Roomdetailed.dart';
// import 'package:flutter_login_signup/src/components/Roomdetailed.dart';
import 'package:flutter_session/flutter_session.dart';
// import 'package:propertyfinder/api/api_get.dart';
// import 'package:flutter_login_signup/api/getRoom.dart';

// class PropertyCarousel extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class SavedRooms extends StatefulWidget {
  @override
  _SavedRoomsState createState() => _SavedRoomsState();
}

class _SavedRoomsState extends State<SavedRooms> {
  List<FavData> _favroom = [];
  // bool _loading;
  var session = FlutterSession();
  // Future id = FlutterSession().get('id');

  @override
  void initState() {
    // _loading = true;
    super.initState();
    ServicesFav.getFavRoom().then((room) {
      setState(() {
        _favroom = room;
        // _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Saved Rooms"),
          backgroundColor: Color.fromRGBO(13, 71, 161, 1)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // GestureDetector(
                  //   onTap: () {},
                  //   //   print('This is see more');
                  //   //   Navigator.push(context,
                  //   //       // MaterialPageRoute(builder: (context) => ListviewPage()));
                  //   // },
                  // ),
                ],
              ),
            ),
            Container(
              height: 570,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 60),
              // color: Colors.grey,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _favroom.length == null ? 0 : _favroom.length,
                itemBuilder: (BuildContext context, int index) {
                  FavData room = _favroom[index];
                  return GestureDetector(
                    // onTap: () {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => PropertyListsView(room: room)));

                    //   session.set("room_id", room.roomId);
                    //   // session.set("user_id", room.userId);
                    //   print("Property_ID ==>" + room.roomId.toString());
                    //   // print("User ==> " + room.userId.toString());
                    // },
                    child: Card(
                      margin: EdgeInsets.fromLTRB(5, 5, 0, 45),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 8, 0, 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 6.0,
                                  )
                                ]),
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(1.0),
                                  child: Image(
                                    height: 185.0,
                                    width: 375.0,
                                    image: NetworkImage(room.thumbImg),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  bottom: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "For Rent",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 195, 0, 15),
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    Icon(
                                      Icons.home_filled,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    Text(
                                      " " + room.roomTitle,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ]),
                                  SizedBox(
                                      height: 2,
                                      child: Divider(color: Colors.black)),
                                  Row(children: [
                                    Icon(
                                      Icons.monetization_on_rounded,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    Text(
                                      " Rs." + room.price.toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.black,
                                        size: 25,
                                      ),
                                      Text(
                                        room.address,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
