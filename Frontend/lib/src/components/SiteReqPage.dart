import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_login_signup/models/RoomData.dart';
import 'package:flutter_login_signup/src/components/Roomdetailed.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/models/InspectionModel.dart';
// import 'package:propertyfinder/config/config.dart';
import 'package:date_time_picker/date_time_picker.dart';

class SiteRequest extends StatefulWidget {
  final Datum room;

  @override
  _RequestInspectionState createState() => _RequestInspectionState();
  SiteRequest(this.room);
}

class _RequestInspectionState extends State<SiteRequest> {
  // var selectedRange = RangeValues(300, 1000);
  // String chosenValue;
  bool sitevisit = false;
  bool roomPrice = false;
  String date;
  // TextEditingController username = TextEditingController();
  // TextEditingController email = TextEditingController();
  // TextEditingController phone = TextEditingController();
  TextEditingController inquiry = TextEditingController();

  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  Inspection siteRequest = Inspection();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Site Inspection"),
          backgroundColor: Color.fromRGBO(13, 71, 161, 1)),
      body: SafeArea(
        child: _requestContent(context),
      ),
    );
  }

  Widget _requestContent(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.perm_device_information_sharp,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Site Inspection Indication and tips",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Please provide your view for our betterment",
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // For the Request basic description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Requests for Visit",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: sitevisit,
                              onChanged: (value) {
                                setState(() {
                                  sitevisit = !sitevisit;
                                });
                                print("Site Visit" + sitevisit.toString());
                              },
                            ),
                            Text(
                              " Site Inspection",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              width: 28,
                            ),
                            Checkbox(
                              value: roomPrice,
                              onChanged: (value) {
                                setState(() {
                                  roomPrice = !roomPrice;
                                });
                                print("Rates and Price" + roomPrice.toString());
                              },
                            ),
                            Text(
                              " Price ",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLines: 5,
                    style: TextStyle(fontSize: 20),
                    controller: inquiry,
                    validator: (input) => !(input.length > 1)
                        ? "Plese provide some details about hte visit"
                        : null,
                    decoration: InputDecoration(
                      hintText: "Add furthure details or visit/inspection date",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Date For Visit",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  DateTimePicker(
                    initialValue: '',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    onChanged: (val) => {date = val},
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => {date = val},
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   "User Details and Information",
                  //   style: TextStyle(
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: globalFormKey,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 10.0,
                          left: 10.0,
                          bottom: 15,
                          top: 5,
                        ),
                        // child: Column(
                        //   children: [
                        //     TextFormField(
                        //       keyboardType: TextInputType.text,
                        //       controller: username,
                        //       decoration: InputDecoration(
                        //           hintText: "User Name", labelText: "UserName"),
                        //     ),
                        //     TextFormField(
                        //       keyboardType: TextInputType.emailAddress,
                        //       controller: email,
                        //       decoration: InputDecoration(
                        //           hintText: "Email", labelText: "Email"),
                        //     ),
                        //     TextFormField(
                        //       keyboardType: TextInputType.number,
                        //       controller: phone,
                        //       decoration: InputDecoration(
                        //           hintText: "ContactNo", labelText: "Phone"),
                        //     ),
                        //   ],
                        // ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  //Flat Button Container
                  FlatButton(
                    onPressed: () {
                      if (date == null || inquiry.text == null) {
                        EasyLoading.showError(
                            "Please provide value of inquiry and date of visit!!");
                      } else {
                        print("Proceed");
                        print(date);
                        // validate();
                        sendReqData();
                        EasyLoading.showSuccess(
                            "Request successfully Registered");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PropertyListsView(room: widget.room)));
                      }
                    },
                    color: Color.fromRGBO(239, 108, 0, 0.9),
                    child: Container(
                      alignment: Alignment.center,
                      width: 355,
                      height: 50,
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendReqData() async {
    int roomid = widget.room.roomId;
    int userid = widget.room.userId;
    siteRequest = Inspection(
        sitevisit: sitevisit.toString(),
        roomPrice: roomPrice.toString(),
        inquiry: inquiry.text,
        date: date);
    var response = await http.post(
        "http://10.0.2.2:5000/v3/$roomid/visitRequest/$userid",
        headers: {"Content-type": "application/json"},
        body: json.encode(siteRequest.toJson()));

    if (response.statusCode == 200) {
      print(response.body);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => WelcomePage()));
    } else {
      print(response);
    }
  }

  bool validate() {
    final form = globalFormKey.currentState;
    //If form is valid then it returns true
    if (form.validate()) {
      sendReqData();
      return true;
    }
    return false;
  }
}
