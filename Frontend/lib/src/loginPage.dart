import 'package:flutter/material.dart';
import 'package:flutter_login_signup/models/loginmodel.dart';
import 'package:flutter_login_signup/src/welcomePage.dart';
import 'package:flutter_login_signup/src/signup.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Model loginmodel = Model();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromRGBO(245, 124, 0, 1),
                Color.fromRGBO(13, 71, 161, 1)
              ])),
          child: ListView(
            children: <Widget>[
              Image.asset(
                'assets/logo.PNG',
                height: 105,
              ),
              Image.asset(
                'assets/login.png',
                height: 165,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  style: TextStyle(fontSize: 17.5),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      fillColor: Colors.transparent,
                      filled: true),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(fontSize: 17.5),
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      fillColor: Colors.transparent,
                      filled: true),
                ),
              ),
              FlatButton(
                onPressed: () {
                  //forgot password screen
                },
                textColor: Colors.black,
                child: Text('Forgot Password ?'),
              ),
              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.orange,
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 25),
                      ),
                      onPressed: () {
                        sendData();
                      })),
              Container(
                  child: Row(
                children: <Widget>[
                  Text('Do not have an account?'),
                  FlatButton(
                    textColor: Colors.amber,
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ))
            ],
          )),
    );
  }

  void sendData() async {
    loginmodel =
        Model(email: nameController.text, password: passwordController.text);
    var response = await http.post("http://10.0.2.2:5000/api/login",
        headers: {"Content-type": "application/json"},
        body: json.encode(loginmodel.toJson()));
    print(response.body);
    if (response.statusCode == 201) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WelcomePage()));
    } else {
      print(Error);
    }
  }
}
