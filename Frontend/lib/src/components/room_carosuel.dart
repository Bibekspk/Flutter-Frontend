import 'package:flutter/material.dart';
import 'package:flutter_login_signup/models/RoomData.dart';
// import 'package:flutter_login_signup/models/searchModel.dart';
import 'package:flutter_login_signup/src/components/Roomdetailed.dart';
import 'package:flutter_session/flutter_session.dart';
// import 'package:propertyfinder/api/api_get.dart';
import 'package:flutter_login_signup/api/getRoom.dart';

// // class PropertyCarousel extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return
// //   }
// // }

// ignore: must_be_immutable
class PropertyCarousel extends StatefulWidget {
  // String startPrice;
  // String endPrice;
  // String search;
  // PropertyCarousel({Key key, this.startPrice, this.endPrice, this.search})
  //     : super(key: key);
  @override
  _PropertyCarouselState createState() => _PropertyCarouselState();
}

class _PropertyCarouselState extends State<PropertyCarousel> {
  List<Datum> _room = [];
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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // SizedBox(
          //   height: 5.0,
          // ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
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
            height: 505,
            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
            // color: Colors.grey,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _room.length == null ? 0 : _room.length,
              itemBuilder: (BuildContext context, int index) {
                Datum room = _room[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PropertyListsView(room: room)));

                    session.set("room_id", room.roomId);
                    // session.set("user_id", room.userId);
                    print("Property_ID ==>" + room.roomId.toString());
                    // print("User ==> " + room.userId.toString());
                  },
                  child: Card(
                    elevation: 10,
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
                        //           // Row(
                        //           //   children: [
                        //           //     Icon(
                        //           //       Icons.bathtub,
                        //           //       color: Colors.black,
                        //           //       size: 25,
                        //           //     ),
                        //           //     SizedBox(
                        //           //       width: 10,
                        //           //     ),
                        //           //     Text(
                        //           //       room.bathroom,
                        //           //       style: TextStyle(
                        //           //         fontSize: 16,
                        //           //       ),
                        //           //     ),
                        //           //     SizedBox(
                        //           //       width: 5,
                        //           //     ),
                        //           //     Icon(
                        //           //       Icons.local_parking,
                        //           //       color: Colors.black,
                        //           //       size: 25,
                        //           //     ),
                        //           //     Text(
                        //           //       room.parking,
                        //           //       style: TextStyle(
                        //           //         fontSize: 16,
                        //           //       ),
                        //           //     ),
                        //           //     SizedBox(
                        //           //       width: 10,
                        //           //     ),
                        //           //   ],
                        //           // )
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
                                    height: 10,
                                    child: Divider(color: Colors.black)),
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

// // import 'package:flutter/material.dart';
// // import 'package:flutter_login_signup/models/VehicleData.dart';
// // import 'package:flutter_login_signup/src/components/Vehicledetailed.dart';
// // import 'package:flutter_session/flutter_session.dart';
// // // import 'package:propertyfinder/api/api_get.dart';
// // import 'package:flutter_login_signup/api/getVehicle.dart';
// // // import 'package:propertyfinder/models/Property.dart';
// // // import 'package:propertyfinder/models/property_model.dart';
// // // import 'package:propertyfinder/modules/listview_page/listview.dart';

// // class PropertyCarousel extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return
// //   }
// // }

// class PropertyCarousel extends StatefulWidget {
//   @override
//   _PropertyCarouselState createState() => _PropertyCarouselState();
// }

// class _PropertyCarouselState extends State<PropertyCarousel> {
//   List<Datum> _vehicle;
//   bool _loading;
//   var session = FlutterSession();

//   @override
//   void initState() {
//     _loading = true;
//     super.initState();
//     Services.getRoom().then((room) {
//       setState(() {
//         _vehicle = room;
//         _loading = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         SizedBox(
//           height: 20.0,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(
//                 'Featured Rooms 🏨',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   print('This is see more');
//                   // await Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) =>PropertyListsView(
//                   //               room: vehicle,
//                   //             )));
//                 },
//                 child: Text(
//                   'See more',
//                   style: TextStyle(
//                     color: Colors.blueGrey[600],
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           height: 330,
//           child: Text(_vehicle[0].address),
//           // color: Colors.grey,
//           // child: ListView.builder(
//           //   scrollDirection: Axis.vertical,
//           //   itemCount: _vehicle.length == null ? 0 : _vehicle.length,
//           //   itemBuilder: (BuildContext context, int index) {
//           //     Datum property = _vehicle[index];
//           //     // PropertyLists propertyLists = propertyList[index];
//           //     return GestureDetector(
//           //       onTap: () {
//           //         print("Tap");
//           //         session.set("property_id", property.roomId);
//           //         // session.set("user_id", property.userId);
//           //         // print("Property_ID ==>" + property.propertyId.toString());
//           //         // print("User ==> " + property.userId.toString());
//           //         Navigator.push(
//           //             context,
//           //             // MaterialPageRoute(
//           //             //     builder: (context) => PropertyListsView(property: property)));
//           //             MaterialPageRoute(
//           //                 builder: (context) =>
//           //                     PropertyListsView(room: property)));
//           //       },
//           //       child: Container(
//           //         margin: EdgeInsets.all(10),
//           //         width: 300,
//           //         // color: Colors.blueGrey[600],
//           //         child: Stack(
//           //           alignment: Alignment.topCenter,
//           //           children: <Widget>[
//           //             Positioned(
//           //               bottom: 0,
//           //               child: Container(
//           //                 height: 148,
//           //                 width: 300,
//           //                 decoration: BoxDecoration(
//           //                   color: Colors.white,
//           //                   borderRadius: BorderRadius.circular(10),
//           //                   boxShadow: [
//           //                     BoxShadow(
//           //                       color: Colors.black26,
//           //                       offset: Offset(0.0, 2.0),
//           //                       blurRadius: 6.0,
//           //                     )
//           //                   ],
//           //                 ),
//           //                 child: Padding(
//           //                   padding: const EdgeInsets.all(9.0),
//           //                   child: Column(
//           //                     crossAxisAlignment: CrossAxisAlignment.start,
//           //                     mainAxisAlignment: MainAxisAlignment.end,
//           //                     children: <Widget>[
//           //                       Text(
//           //                         property.roomTitle,
//           //                         style: TextStyle(
//           //                           fontSize: 16,
//           //                           fontWeight: FontWeight.bold,
//           //                         ),
//           //                       ),
//           //                       SizedBox(
//           //                         height: 2,
//           //                       ),
//           //                       Text(
//           //                         "Rs." + property.price.toString(),
//           //                         style: TextStyle(
//           //                           fontSize: 18,
//           //                           fontWeight: FontWeight.bold,
//           //                         ),
//           //                       ),
//           //                       SizedBox(
//           //                         height: 2,
//           //                       ),
//           //                       // Text(
//           //                       //   propertyLists.propertyAddress,
//           //                       //   style: TextStyle(
//           //                       //     fontWeight: FontWeight.w400,
//           //                       //     fontSize: 14,
//           //                       //   ),
//           //                       // ),
//           //                       // Text(
//           //                       //   propertyLists.propertyDescription,
//           //                       //   style: TextStyle(color: Colors.grey),
//           //                       // ),
//           //                       SizedBox(
//           //                           height: 30,
//           //                           child: Divider(color: Colors.black)),
//           //                       Container(
//           //                           child: Row(
//           //                         children: [
//           //                           Icon(
//           //                             Icons.directions,
//           //                             color: Colors.black,
//           //                             size: 20,
//           //                           ),
//           //                           SizedBox(
//           //                             width: 10,
//           //                           ),
//           //                           Text(
//           //                             property.bathroom,
//           //                             style: TextStyle(
//           //                               fontSize: 16,
//           //                             ),
//           //                           ),
//           //                           SizedBox(
//           //                             width: 5,
//           //                           ),
//           //                           Icon(
//           //                             Icons.single_bed,
//           //                             color: Colors.black,
//           //                             size: 20,
//           //                           ),
//           //                         ],
//           //                       )

//           //                           // Row(
//           //                           //   children: (property.propertyType == "Land" || property.propertyType == "Business") ? Text("Land and Building") : Text("data");
//           //                           // )
//           //                           ),
//           //                     ],
//           //                   ),
//           //                 ),
//           //               ),
//           //             ),
//           //             Container(
//           //               decoration: BoxDecoration(
//           //                   color: Colors.white,
//           //                   borderRadius: BorderRadius.circular(20.0),
//           //                   boxShadow: [
//           //                     BoxShadow(
//           //                       color: Colors.black26,
//           //                       offset: Offset(0.0, 2.0),
//           //                       blurRadius: 6.0,
//           //                     )
//           //                   ]),
//           //               child: Stack(
//           //                 children: <Widget>[
//           //                   ClipRRect(
//           //                     borderRadius: BorderRadius.circular(10.0),
//           //                     child: Image(
//           //                       height: 180.0,
//           //                       width: 320.0,
//           //                       image: NetworkImage(property.images[0]),
//           //                       fit: BoxFit.cover,
//           //                     ),
//           //                   ),
//           //                   Positioned(
//           //                     left: 10,
//           //                     bottom: 5,
//           //                     child: Column(
//           //                       crossAxisAlignment: CrossAxisAlignment.start,
//           //                       children: <Widget>[
//           //                         Text(
//           //                           property.address,
//           //                           style: TextStyle(
//           //                               color: Colors.white,
//           //                               fontWeight: FontWeight.bold,
//           //                               fontSize: 20),
//           //                         ),
//           //                         Text(
//           //                           property.Latitude,
//           //                           style: TextStyle(color: Colors.white),
//           //                         )
//           //                       ],
//           //                     ),
//           //                   ),
//           //                 ],
//           //               ),
//           //             ),
//           //           ],
//           //         ),
//           //       ),
//           //     );
//           //   },
//           // ),
//         ),
//       ],
//     );
//   }

// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: <Widget>[
// //         SizedBox(
// //           height: 20.0,
// //         ),
// //         Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 20.0),
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: <Widget>[
// //               Text(
// //                 'Featured vehicles',
// //                 style: TextStyle(
// //                   fontSize: 22,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //               GestureDetector(
// //                 onTap: () {},
// //                 //   print('This is see more');
// //                 //   Navigator.push(context,
// //                 //       // MaterialPageRoute(builder: (context) => ListviewPage()));
// //                 // },
// //                 child: Text(
// //                   'See more',
// //                   style: TextStyle(
// //                     color: Colors.blueGrey[600],
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.w600,
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         Container(
// //           height: 410,
// //           // color: Colors.grey,
// //           child: Image(
// //             image: AssetImage("assets/login.png"),
// //           ),
// //           // child: ListView.builder(
// //           //   scrollDirection: Axis.horizontal,
// //           //   itemCount: _vehicle.length == null ? 0 : _vehicle.length,
// //           //   itemBuilder: (BuildContext context, int index) {
// //           //     Data vehicle = _vehicle[index];

// //           //     return GestureDetector(
// //           //       onTap: () {
// //           //         Navigator.push(
// //           //             context,
// //           //             // MaterialPageRoute(
// //           //             //     builder: (context) => PropertyListsView(property: property)));
// //           //             MaterialPageRoute(
// //           //                 builder: (context) =>
// //           //                     PropertyListsView(room: vehicle)));
// //           //         print("Tap");
// //           //         session.set("roomid", vehicle.roomId);
// //           //         session.set("id", vehicle.userId);
// //           //         print("Property_ID ==>" + vehicle.roomId.toString());
// //           //         print("User ==> " + vehicle.userId.toString());
// //           //       },
// //           //       child: Card(
// //           //         margin: EdgeInsets.all(10),
// //           //         child: Stack(
// //           //           alignment: Alignment.topCenter,
// //           //           children: <Widget>[
// //           //             Positioned(
// //           //               bottom: 0,
// //           //               child: Container(
// //           //                 height: 280,
// //           //                 width: 300,
// //           //                 decoration: BoxDecoration(
// //           //                   color: Colors.white,
// //           //                   borderRadius: BorderRadius.circular(10),
// //           //                   boxShadow: [
// //           //                     BoxShadow(
// //           //                       color: Colors.black26,
// //           //                       offset: Offset(0.0, 2.0),
// //           //                       blurRadius: 6.0,
// //           //                     )
// //           //                   ],
// //           //                 ),
// //           //                 child: Padding(
// //           //                   padding: const EdgeInsets.all(9.0),
// //           //                   child: Column(
// //           //                     crossAxisAlignment: CrossAxisAlignment.start,
// //           //                     mainAxisAlignment: MainAxisAlignment.end,
// //           //                     children: <Widget>[
// //           //                       Row(children: <Widget>[
// //           //                         Icon(
// //           //                           Icons.home_filled,
// //           //                           color: Colors.black,
// //           //                           size: 25,
// //           //                         ),
// //           //                         Text(
// //           //                           vehicle.Latitude,
// //           //                           style: TextStyle(
// //           //                             fontSize: 16,
// //           //                             fontWeight: FontWeight.bold,
// //           //                           ),
// //           //                         ),
// //           //                       ]),

// //           //                       SizedBox(
// //           //                           height: 2,
// //           //                           child: Divider(color: Colors.black)),

// //           //                       Text(
// //           //                         "Rs." + vehicle.price.toString(),
// //           //                         style: TextStyle(
// //           //                           fontSize: 18,
// //           //                           fontWeight: FontWeight.bold,
// //           //                         ),
// //           //                       ),
// //           //                       SizedBox(
// //           //                         height: 5,
// //           //                       ),
// //           //                       Text(
// //           //                         vehicle.address,
// //           //                         style: TextStyle(
// //           //                           fontWeight: FontWeight.bold,
// //           //                           fontSize: 16,
// //           //                         ),
// //           //                       ),
// //           //                       // Text(
// //           //                       //   propertyLists.propertyDescription,
// //           //                       //   style: TextStyle(color: Colors.grey),
// //           //                       // ),
// //           //                       SizedBox(
// //           //                           height: 30,
// //           //                           child: Divider(color: Colors.black)),
// //           //                       Row(
// //           //                         children: [
// //           //                           Icon(
// //           //                             Icons.bathtub,
// //           //                             color: Colors.black,
// //           //                             size: 25,
// //           //                           ),
// //           //                           SizedBox(
// //           //                             width: 10,
// //           //                           ),
// //           //                           Text(
// //           //                             vehicle.description,
// //           //                             style: TextStyle(
// //           //                               fontSize: 16,
// //           //                             ),
// //           //                           ),
// //           //                           SizedBox(
// //           //                             width: 5,
// //           //                           ),
// //           //                           Icon(
// //           //                             Icons.local_parking,
// //           //                             color: Colors.black,
// //           //                             size: 25,
// //           //                           ),
// //           //                           Text(
// //           //                             vehicle.bathroom,
// //           //                             style: TextStyle(
// //           //                               fontSize: 16,
// //           //                             ),
// //           //                           ),
// //           //                           SizedBox(
// //           //                             width: 10,
// //           //                           ),
// //           //                         ],
// //           //                       ),
// //           //                       SizedBox(
// //           //                           height: 30,
// //           //                           child: Divider(color: Colors.black)),
// //           //                       Row(
// //           //                         children: [
// //           //                           Icon(
// //           //                             Icons.bathtub,
// //           //                             color: Colors.black,
// //           //                             size: 25,
// //           //                           ),
// //           //                           SizedBox(
// //           //                             width: 10,
// //           //                           ),
// //           //                           Text(
// //           //                             vehicle.description,
// //           //                             style: TextStyle(
// //           //                               fontSize: 16,
// //           //                             ),
// //           //                           ),
// //           //                           SizedBox(
// //           //                             width: 5,
// //           //                           ),
// //           //                           Icon(
// //           //                             Icons.local_parking,
// //           //                             color: Colors.black,
// //           //                             size: 25,
// //           //                           ),
// //           //                           Text(
// //           //                             vehicle.parking,
// //           //                             style: TextStyle(
// //           //                               fontSize: 16,
// //           //                             ),
// //           //                           ),
// //           //                           SizedBox(
// //           //                             width: 10,
// //           //                           ),
// //           //                         ],
// //           //                       )
// //           //                     ],
// //           //                   ),
// //           //                 ),
// //           //               ),
// //           //             ),
// //           //             Container(
// //           //               decoration: BoxDecoration(
// //           //                   color: Colors.white,
// //           //                   borderRadius: BorderRadius.circular(20.0),
// //           //                   boxShadow: [
// //           //                     BoxShadow(
// //           //                       color: Colors.black26,
// //           //                       offset: Offset(0.0, 2.0),
// //           //                       blurRadius: 6.0,
// //           //                     )
// //           //                   ]),
// //           //               child: Stack(
// //           //                 children: <Widget>[
// //           //                   ClipRRect(
// //           //                     borderRadius: BorderRadius.circular(10.0),
// //           //                     child: Image(
// //           //                       height: 180.0,
// //           //                       width: 320.0,
// //           //                       image: NetworkImage(vehicle.thumbImg),
// //           //                       fit: BoxFit.cover,
// //           //                     ),
// //           //                   ),
// //           //                   Positioned(
// //           //                     left: 10,
// //           //                     bottom: 5,
// //           //                     child: Column(
// //           //                       crossAxisAlignment: CrossAxisAlignment.start,
// //           //                       children: <Widget>[
// //           //                         Text(
// //           //                           vehicle.description,
// //           //                           style: TextStyle(color: Colors.white),
// //           //                         )
// //           //                       ],
// //           //                     ),
// //           //                   ),
// //           //                 ],
// //           //               ),
// //           //             ),
// //           //           ],
// //           //         ),
// //           //       ),
// //           //     );
// //           //   },
// //           // ),
// //         ),
// //       ],
// //     );
// //   }
// // }
// }
