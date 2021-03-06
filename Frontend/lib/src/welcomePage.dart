import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/loginPage.dart';
import 'package:flutter_login_signup/src/signup.dart';
// import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // Widget _submitButton() {
  //   return InkWell(
  //       onTap: () {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => LoginPage()));
  //       },
  //       child: Container(
  //         width: MediaQuery.of(context).size.width,
  //         padding: EdgeInsets.symmetric(vertical: 13),
  //         alignment: Alignment.center,
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.all(Radius.circular(5)),
  //             boxShadow: <BoxShadow>[
  //               BoxShadow(
  //                   color: Color(0xffdf8e33).withAlpha(100),
  //                   offset: Offset(2, 4),
  //                   blurRadius: 8,
  //                   spreadRadius: 2)
  //             ],
  //             color: Color(0xfffbb448)),
  //         child: Text(
  //           'Login',
  //           style: TextStyle(fontSize: 20, color: Colors.white),
  //         ),
  //       ));
  // }

  // Widget _signUpButton() {
  //   return InkWell(
  //     onTap: () {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => SignUpPage()));
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       padding: EdgeInsets.symmetric(vertical: 13),
  //       alignment: Alignment.center,
  //       //color: Colors.indigo[300],
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.all(Radius.circular(5)),
  //         border: Border.all(color: Colors.transparent, width: 2),
  //         color: Color(0xfffbb448),
  //       ),
  //       child: Text(
  //         'Register',
  //         style: TextStyle(fontSize: 20, color: Colors.white),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 10),
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromRGBO(245, 124, 0, 1),
                Color.fromRGBO(13, 71, 161, 1)
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo.PNG',
                height: 135,
              ),
              Container(
                  height: 60,
                  width: 350,
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: RaisedButton(
                      textColor: Colors.white,
                      color: Color.fromRGBO(239, 108, 0, 0.9),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      })),
              Container(
                  height: 60,
                  width: 350,
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  // margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: RaisedButton(
                      textColor: Colors.white,
                      color: Color.fromRGBO(239, 108, 0, 0.9),
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      })),
              SizedBox(
                height: 21,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
