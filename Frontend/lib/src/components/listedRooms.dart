import 'package:flutter/material.dart';
import 'package:flutter_login_signup/models/RoomData.dart';
import 'package:flutter_login_signup/src/components/Roomdetailed.dart';
import 'package:flutter_login_signup/src/components/editProperty.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:flutter_login_signup/api/getRoom.dart';

// class PropertyCarousel extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

// ignore: must_be_immutable
class ListedRooms extends StatefulWidget {
  // String startPrice;
  // String endPrice;
  // String search;
  // SearchedRooms({Key key, this.startPrice, this.endPrice, this.search})
  //     : super(key: key);

  // get room => null;
  @override
  _ListedRoomsState createState() => _ListedRoomsState();
}

class _ListedRoomsState extends State<ListedRooms> {
  List<Data> _room = [];
  bool _loading;
  var session = FlutterSession();

  @override
  void initState() {
    _loading = true;
    super.initState();
    Services.listedRoom().then((room) {
      setState(() {
        _room = room;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Added Rooms"),
          backgroundColor: Color.fromRGBO(13, 71, 161, 1)),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Listed Rooms',
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
                    _room.length.toString() + " results found",
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
            height: 530,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
            // color: Colors.grey,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _room.length == null ? 0 : _room.length,
              itemBuilder: (BuildContext context, int index) {
                Data room = _room[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PropertyListsView(room: room)));

                    session.set("roomid", room.roomId);
                    // session.set("user_id", room.userId);
                    print("Room_Id ==>" + room.roomId.toString());
                    print("User ==> " + room.userId.toString());
                  },
                  child: Card(
                    color: Colors.blueGrey[100],
                    margin: EdgeInsets.fromLTRB(5, 5, 0, 15),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        // Positioned(
                        //   bottom: 0,
                        //   child: Container(
                        //     height: 280,
                        //     width: 300,
                        //     decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.circular(10),
                        //       boxShadow: [
                        //         BoxShadow(
                        //           color: Colors.black26,
                        //           offset: Offset(0.0, 2.0),
                        //           blurRadius: 6.0,
                        //         )
                        //       ],
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(9.0),
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         mainAxisAlignment: MainAxisAlignment.end,
                        //         children: <Widget>[
                        //           Row(children: <Widget>[
                        //             Icon(
                        //               Icons.home_filled,
                        //               color: Colors.black,
                        //               size: 25,
                        //             ),
                        //             Text(
                        //               room.roomTitle,
                        //               style: TextStyle(
                        //                 fontSize: 16,
                        //                 fontWeight: FontWeight.bold,
                        //               ),
                        //             ),
                        //           ]),

                        //           SizedBox(
                        //               height: 2,
                        //               child: Divider(color: Colors.black)),

                        //           Text(
                        //             "Rs." + room.price.toString(),
                        //             style: TextStyle(
                        //               fontSize: 18,
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             height: 5,
                        //           ),
                        //           Text(
                        //             room.address,
                        //             style: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 16,
                        //             ),
                        //           ),
                        //           // Text(
                        //           //   propertyLists.propertyDescription,
                        //           //   style: TextStyle(color: Colors.grey),
                        //           // ),
                        //           SizedBox(
                        //               height: 30,
                        //               child: Divider(color: Colors.black)),
                        //           Row(
                        //             children: [
                        //               Icon(
                        //                 Icons.bathtub,
                        //                 color: Colors.black,
                        //                 size: 25,
                        //               ),
                        //               SizedBox(
                        //                 width: 10,
                        //               ),
                        //               Text(
                        //                 room.bathroom,
                        //                 style: TextStyle(
                        //                   fontSize: 16,
                        //                 ),
                        //               ),
                        //               SizedBox(
                        //                 width: 5,
                        //               ),
                        //               Icon(
                        //                 Icons.local_parking,
                        //                 color: Colors.black,
                        //                 size: 25,
                        //               ),
                        //               Text(
                        //                 room.parking,
                        //                 style: TextStyle(
                        //                   fontSize: 16,
                        //                 ),
                        //               ),
                        //               SizedBox(
                        //                 width: 10,
                        //               ),
                        //             ],
                        //           ),
                        //           SizedBox(
                        //               height: 30,
                        //               child: Divider(color: Colors.black)),
                        //           Row(
                        //             children: [
                        //               Icon(
                        //                 Icons.bathtub,
                        //                 color: Colors.black,
                        //                 size: 25,
                        //               ),
                        //               SizedBox(
                        //                 width: 10,
                        //               ),
                        //               Text(
                        //                 room.bathroom,
                        //                 style: TextStyle(
                        //                   fontSize: 16,
                        //                 ),
                        //               ),
                        //               SizedBox(
                        //                 width: 5,
                        //               ),
                        //               Icon(
                        //                 Icons.local_parking,
                        //                 color: Colors.black,
                        //                 size: 25,
                        //               ),
                        //               Text(
                        //                 room.parking,
                        //                 style: TextStyle(
                        //                   fontSize: 16,
                        //                 ),
                        //               ),
                        //               SizedBox(
                        //                 width: 10,
                        //               ),
                        //             ],
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Edit",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      splashColor: Colors.green[600],
                                      splashRadius: 53.0,
                                      icon: Icon(
                                        Icons.edit,
                                        size: 40,
                                      ),
                                      onPressed: () {
                                        session.set('roomid', room.roomId);
                                        print((room.roomId));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditRoom()));
                                      },
                                      color: Colors.green[600],
                                    ),
                                    Text(
                                      "Delete",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      splashColor: Colors.red[600],
                                      splashRadius: 53.0,
                                      icon: Icon(
                                        Icons.delete,
                                        size: 40,
                                      ),
                                      onPressed: () {},
                                      color: Colors.red[600],
                                    ),
                                  ],
                                ),
                                // Text(
                                //   propertyLists.propertyDescription,
                                //   style: TextStyle(color: Colors.grey),
                                // ),
                                // SizedBox(
                                //     height: 30,
                                //     child: Divider(color: Colors.black)),
                                // Row(
                                //   children: [
                                //     Icon(
                                //       Icons.bathtub,
                                //       color: Colors.black,
                                //       size: 25,
                                //     ),
                                //     SizedBox(
                                //       width: 10,
                                //     ),
                                //     Text(
                                //       room.bathroom,
                                //       style: TextStyle(
                                //         fontSize: 16,
                                //       ),
                                //     ),
                                //     SizedBox(
                                //       width: 5,
                                //     ),
                                //     Icon(
                                //       Icons.local_parking,
                                //       color: Colors.black,
                                //       size: 25,
                                //     ),
                                //     Text(
                                //       room.parking,
                                //       style: TextStyle(
                                //         fontSize: 16,
                                //       ),
                                //     ),
                                //     SizedBox(
                                //       width: 10,
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(
                                //     height: 30,
                                //     child: Divider(color: Colors.black)),
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
    );
  }
}
