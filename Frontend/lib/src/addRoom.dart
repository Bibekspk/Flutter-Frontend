import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/addimg.dart';
import 'package:flutter_login_signup/src/welcomePage.dart';
import 'package:flutter_login_signup/models/registermodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Roompage extends StatefulWidget {
  @override
  _AddRoomPageState createState() => _AddRoomPageState();
}

// enum status { available, unavailable }

class _AddRoomPageState extends State<Roompage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  RegisterModel regmodel = RegisterModel();

  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  bool parking;
  bool bathroom;

  @override
  Widget build(BuildContext context) {
    // status _value = status.available;
    return Scaffold(
        appBar: AppBar(backgroundColor: Color.fromRGBO(13, 71, 161, 1)),
        body: Form(
            key: globalFormKey,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromRGBO(245, 124, 0, 1),
                    Color.fromRGBO(13, 71, 161, 1)
                  ])),
              child: ListView(children: <Widget>[
                Image.asset(
                  'assets/logo.PNG',
                  height: 105,
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'ADD ROOM',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    style: TextStyle(fontSize: 19),
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    validator: (input) => !(input.length > 3)
                        ? "Plese provide valid room information"
                        : null,
                    decoration: InputDecoration(
                        labelText: 'Room Title',
                        labelStyle:
                            TextStyle(fontSize: 19.0, color: Colors.black),
                        fillColor: Color(0x00000000),
                        filled: true,
                        errorStyle:
                            TextStyle(fontSize: 19.0, color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    style: TextStyle(fontSize: 19),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (input) => !(input.length > 3)
                        ? "Plese provide valid room information"
                        : null,
                    decoration: InputDecoration(
                        errorStyle:
                            TextStyle(fontSize: 19.0, color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Description',
                        labelStyle:
                            TextStyle(fontSize: 19.0, color: Colors.black),
                        fillColor: Color(0x00000000),
                        filled: true),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(fontSize: 19),
                    controller: contactController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Address',
                        labelStyle:
                            TextStyle(fontSize: 19.0, color: Colors.black),
                        fillColor: Color(0x00000000),
                        filled: true),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    // obscureText: true,
                    style: TextStyle(fontSize: 17.5),
                    controller: passwordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Price',
                        labelStyle:
                            TextStyle(fontSize: 19.0, color: Colors.black),
                        fillColor: Color(0x00000000),
                        filled: true),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Select Images',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: IconButton(
                    alignment: Alignment.topLeft,
                    focusColor: Colors.blue,
                    iconSize: 50,
                    splashColor: Colors.white,
                    icon: Icon(Icons.add_a_photo, color: Colors.blue, size: 50),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Imgpicker()));
                    },
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Parking',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Radio(
                          value: true,
                          groupValue: parking,
                          activeColor: Colors.blue,
                          onChanged: (T) {
                            print(T);
                            setState(() {
                              parking = T;
                            });
                          }),
                      Text(
                        'Available',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Radio(
                        value: false,
                        groupValue: parking,
                        onChanged: (T) {
                          print(T);
                          setState(() {
                            parking = T;
                          });
                        },
                      ),
                      Text(
                        'Unavailable',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Attached Bathroom',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Radio(
                          value: true,
                          groupValue: bathroom,
                          activeColor: Colors.blue,
                          onChanged: (T) {
                            print(T);
                            setState(() {
                              bathroom = T;
                            });
                          }),
                      Text(
                        'Available',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Radio(
                        value: false,
                        groupValue: bathroom,
                        onChanged: (T) {
                          print(T);
                          setState(() {
                            bathroom = T;
                          });
                        },
                      ),
                      Text(
                        'Unavailable',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // Row(
                //   children: <Widget>[
                //     ListTile(
                //       title: const Text('Lafayette'),
                //       leading: Radio(
                //         value: status.available,
                //         groupValue: _value,
                //         onChanged: (status value) {
                //           setState(() {
                //             _value = value;
                //           });
                //         },
                //       ),
                //     ),
                //     ListTile(
                //       title: const Text('Thomas Jefferson'),
                //       leading: Radio(
                //         value: status.available,
                //         groupValue: _value,
                //         onChanged: (status value) {
                //           setState(() {
                //             _value = value;
                //           });
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Color.fromRGBO(239, 108, 0, 0.9),
                        child: Text(
                          'Add Room',
                          style: TextStyle(fontSize: 23),
                        ),
                        onPressed: () {
                          validate();
                          print(emailController.text);
                        })),
              ]),
            )));
  }

  void sendregdata() async {
    regmodel = RegisterModel(
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text,
        passwordconfirm: confirmpasswordController.text,
        phone: contactController.text);
    var response = await http.post("http://10.0.2.2:5000/api/register",
        headers: {"Content-type": "application/json"},
        body: json.encode(regmodel.toJson()));
    print(response.body);
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WelcomePage()));
    } else {
      print(response);
    }
  }

  bool validate() {
    final form = globalFormKey.currentState;
    //If form is valid then it returns true
    if (form.validate()) {
      sendregdata();
      return true;
    }
    return false;
  }
}
