import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_login_signup/models/favRoomModel.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/api/getRoom.dart';
import 'package:flutter_login_signup/config/config.dart';
import 'package:flutter_login_signup/models/RoomData.dart';
import 'package:flutter_login_signup/src/components/SiteReqPage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  // String uncheckFavorites = widget.room.favStatus;
  // String favStatus = widget.room.favStatus; //getting value of favStatus
  // bool uncheckFavorites = favStatus == "true" ? true : false;
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

  Set<Marker> _markers = {};
  // GoogleMapController controller;
  GoogleMapController controller;

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('mark-i'),
          position: LatLng(
            double.parse(widget.room.Latitude),
            double.parse(widget.room.Longitude),
          ),
        ),
      );
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
                  heroTag: "call",
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
                      Radius.circular(5.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 21,
              ),
              Container(
                width: 150,
                child: FloatingActionButton.extended(
                  heroTag: "Site Visit",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SiteRequest(widget.room)));
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
                      Radius.circular(5.0),
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
                                      if (uncheckFavorites == false) {
                                        if (removeFav() != null) {
                                          EasyLoading.showSuccess(
                                              "Removed From Cart");
                                        }
                                      }
                                      if (uncheckFavorites == true) {
                                        if (setFav() != null) {
                                          print("unselected");
                                          EasyLoading.showSuccess(
                                              "Added to Cart");
                                        }
                                      }
                                    });
                                  },
                                )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                            SizedBox(
                              width: 10,
                              height: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Location (Map)",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 10,
                                          blurRadius: 10,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    width: size.width,
                                    height: size.height * 0.30,
                                    child: GoogleMap(
                                      onMapCreated: _onMapCreated(controller),
                                      markers: _markers,
                                      initialCameraPosition: CameraPosition(
                                        target: LatLng(
                                          double.parse(widget.room.Latitude),
                                          double.parse(widget.room.Longitude),
                                        ),
                                        zoom: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                              height: 15,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.supervised_user_circle,
                                  size: 35,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Owner Details",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Divider(
                              height: 3,
                              color: Colors.black,
                            ),
                            SizedBox(height: 4, width: 2),
                            Row(
                              children: [
                                Icon(
                                  Icons.person_pin_sharp,
                                  size: 30,
                                ),
                                Text(
                                  " Name : ",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "  " + widget.room.userDetail.name.trim(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: 30,
                                ),
                                Text(
                                  " Contact : ",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "  " + widget.room.userDetail.contact.trim(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
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

  Future<bool> removeFav() async {
    String url = baseURL;
    int userid = await FlutterSession().get("id");
    int roomid = widget.room.roomId;
    String token = await FlutterSession().get("token");
    final response = await http.delete(url + "/delfavRoom/$roomid/$userid",
        headers: {"Content-type": "application/json", "Authorization": token});
    print(response);
    if (response.statusCode == 200) {
      return true;
    } else {
      return null;
    }
  }

  Future<bool> setFav() async {
    String url = baseURL;
    int userid = await FlutterSession().get("id");
    int roomid = widget.room.roomId;
    String token = await FlutterSession().get("token");
    final response = await http.post(url + "/favRoom/$roomid/$userid",
        headers: {"Content-type": "application/json", "Authorization": token});
    print(response);
    if (response.statusCode == 200) {
      return true;
    } else {
      return null;
    }
  }
}
