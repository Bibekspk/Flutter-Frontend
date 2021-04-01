// import 'dart:html';
// import 'package:flutter_login_signup/src/components/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/addRoom.dart';
import 'package:flutter_login_signup/src/components/body.dart';
import 'package:flutter_login_signup/src/components/viewImg.dart';
// import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: AppbarWidget(),
      ),
      body: Body(),
      bottomNavigationBar: BottomNavigationBar(
          // type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }),
                label: ''),
            BottomNavigationBarItem(
                icon: IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Roompage()));
                    }),
                label: ''),
            BottomNavigationBarItem(
                icon: IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Viewimg()));
                    }),
                label: ''),
          ]),
    );
  }
}

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu),
      color: Colors.black,
      onPressed: () {},
    );
  }
}
