import 'package:flutter/material.dart';
import 'package:flutter_login_signup/api/getRoom.dart';
import 'package:flutter_login_signup/models/RoomData.dart';

// class PropertyListsView extends StatelessWidget {
//   final Property property;

//   PropertyListsView({@required this.property});
//   @override
//   Widget build(BuildContext context) {

// }

class PropertyListsView extends StatefulWidget {
  final Data room;

  PropertyListsView({this.room});
  @override
  _PropertyListsViewState createState() => _PropertyListsViewState();
}

class _PropertyListsViewState extends State<PropertyListsView> {
  List<Data> _room;
  bool uncheckFavorites = false;

  @override
  void initState() {
    super.initState();
    Services.getRoom().then((room) {
      setState(() {
        _room = room;
        // _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenWidth = MediaQuery.of(context).size;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 10,
        ),
        width: screenWidth.width,
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: FloatingActionButton.extended(
                  heroTag: "btn1",
                  onPressed: () {
                    print("Button call has been pressed");
                  },
                  backgroundColor: Colors.black,
                  label: Text('Call'),
                  icon: Icon(
                    Icons.phone,
                    color: Colors.green,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 150,
                child: FloatingActionButton.extended(
                  heroTag: "btn2",
                  onPressed: () {
                    print("Button call has been pressed");
                  },
                  backgroundColor: Colors.black,
                  label: Text('Site Visit'),
                  icon: Icon(
                    Icons.visibility_sharp,
                    color: Colors.blue,
                  ),
                  hoverColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: <Widget>[
                  // Text(widget.property.description),
                  Hero(
                    tag: widget.room,
                    child: Container(
                      height: size.height * 0.40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.room.thumbImg),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            stops: [0.4, 1.0],
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //For property Details of the Specific property
                  //
                  Container(
                    height: size.height * 0.30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Padding(
                        //   padding:
                        //       EdgeInsets.symmetric(horizontal: 21, vertical: 8),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: Colors.yellow[700],
                        //       borderRadius: BorderRadius.all(
                        //         Radius.circular(5),
                        //       ),
                        //     ),
                        //     width: 110,
                        //     padding: EdgeInsets.symmetric(vertical: 2),
                        //     // child: Center(
                        //     //   child: Row(
                        //     //     children: <Widget>[
                        //     //       Text(
                        //     //         "FOR " + property[0].label,
                        //     //         style: TextStyle(
                        //     //           fontSize: 22,
                        //     //           color: Colors.white,
                        //     //           fontWeight: FontWeight.bold,
                        //     //         ),
                        //     //       ),
                        //     //     ],
                        //     //   ),
                        //     // ),
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 21, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Text(
                              //   widget.room.roomTitle,
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //     fontSize: 18,
                              //     fontWeight: FontWeight.w600,
                              //   ),
                              // ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                    child: IconButton(
                                  icon: Icon(!uncheckFavorites
                                      ? Icons.favorite_border
                                      : Icons.favorite),
                                  onPressed: () {
                                    setState(() {
                                      uncheckFavorites = !uncheckFavorites;
                                      print('Pressed favorite button');
                                    });
                                  },
                                )),
                              ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //       left: 14, right: 24, top: 0, bottom: 0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Row(
                        //         children: [
                        //           // Icon(
                        //           //   Icons.directions,
                        //           //   color: Colors.white,
                        //           //   size: 28,
                        //           // ),
                        //           // SizedBox(
                        //           //   width: 4,
                        //           // ),
                        //           // Text(
                        //           //   "North",
                        //           //   style: TextStyle(
                        //           //     color: Colors.white,
                        //           //     fontSize: 15,
                        //           //   ),
                        //           // ),
                        //           SizedBox(
                        //             width: 10,
                        //           ),
                        //           Icon(
                        //             Icons.aspect_ratio,
                        //             color: Colors.white,
                        //             size: 28,
                        //           ),
                        //           SizedBox(
                        //             width: 4,
                        //           ),
                        //           Text(
                        //             widget.room.address,
                        //             style: TextStyle(
                        //               color: Colors.white,
                        //               fontSize: 15,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),

                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Container(
                  //     height: size.height * 0.55,
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(30),
                  //         topRight: Radius.circular(30),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, right: 18.0, left: 18.0, bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 27,
                                        decoration: BoxDecoration(
                                          color: Colors.blueGrey[600],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                        child: Text(
                                          " Room ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Divider(color: Colors.black),
                                      Text.rich(
                                        TextSpan(
                                          text: (widget.room.roomTitle),
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: widget.room.address,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Rs.\t" + widget.room.price,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(color: Colors.black),
                          ],
                        ),
                      ),
                      Container(
                        width: size.width,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 80),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 27,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[600],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Text(
                                " Room Overview ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.roofing_outlined,
                                  size: 18,
                                ),
                                Text(
                                  "Number of Rooms : ",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8,
                                  width: 6,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: widget.room.roomno.toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.local_parking_rounded,
                                  size: 18,
                                ),
                                Text(
                                  "Parking : ",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: widget.room.parking,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.bathtub,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "Bathroom : ",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: widget.room.parking,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Divider(color: Colors.black),
                            Container(
                              height: 30,
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[600],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Room Description",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                              ),
                            ),
                            // SizedBox(width: 10),
                            Text(
                              widget.room.description,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
