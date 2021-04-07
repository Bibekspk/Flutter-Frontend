import 'package:flutter/material.dart';
import 'package:flutter_login_signup/models/RoomData.dart';
import 'package:flutter_login_signup/src/components/Roomdetailed.dart';
import 'package:flutter_session/flutter_session.dart';
// import 'package:propertyfinder/api/api_get.dart';
import 'package:flutter_login_signup/api/getRoom.dart';
// import 'package:propertyfinder/models/Property.dart';
// import 'package:propertyfinder/models/property_model.dart';
// import 'package:propertyfinder/modules/listview_page/listview.dart';

// class PropertyCarousel extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class PropertyCarousel extends StatefulWidget {
  @override
  _PropertyCarouselState createState() => _PropertyCarouselState();
}

class _PropertyCarouselState extends State<PropertyCarousel> {
  List<Data> _room;
  bool _loading;
  var session = FlutterSession();

  @override
  void initState() {
    _loading = true;
    super.initState();
    Services.getRoom().then((room) {
      setState(() {
        _room = room;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Featured Rooms',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                //   print('This is see more');
                //   Navigator.push(context,
                //       // MaterialPageRoute(builder: (context) => ListviewPage()));
                // },
                child: Text(
                  'See more',
                  style: TextStyle(
                    color: Colors.blueGrey[600],
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 410,
          // color: Colors.grey,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _room.length == null ? 0 : _room.length,
            itemBuilder: (BuildContext context, int index) {
              Data room = _room[index];
              // RoomData roomList = roomlist[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      // MaterialPageRoute(
                      //     builder: (context) => PropertyListsView(property: property)));
                      MaterialPageRoute(
                          builder: (context) => PropertyListsView(room: room)));
                  print("Tap");
                  session.set("property_id", room.roomId);
                  session.set("user_id", room.userId);
                  print("Property_ID ==>" + room.roomId.toString());
                  print("User ==> " + room.userId.toString());
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 280,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0,
                              )
                            ],
                          ),
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
                                    room.roomTitle,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),

                                SizedBox(
                                    height: 2,
                                    child: Divider(color: Colors.black)),

                                Text(
                                  "Rs." + room.price.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  room.address,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                // Text(
                                //   propertyLists.propertyDescription,
                                //   style: TextStyle(color: Colors.grey),
                                // ),
                                SizedBox(
                                    height: 30,
                                    child: Divider(color: Colors.black)),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.bathtub,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      room.bathroom,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.local_parking,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    Text(
                                      room.parking,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: 30,
                                    child: Divider(color: Colors.black)),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.bathtub,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      room.bathroom,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.local_parking,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    Text(
                                      room.parking,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image(
                                height: 180.0,
                                width: 320.0,
                                image: NetworkImage(room.thumbImg),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              left: 10,
                              bottom: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    room.description,
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
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
    );
  }
}
