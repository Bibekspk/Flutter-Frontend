// import 'package:flutter_login_signup/src/components/appbar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_login_signup/src/addRoom.dart';
import 'package:flutter_login_signup/src/components/appbar.dart';
import 'package:flutter_login_signup/src/components/body.dart';
import 'package:flutter_login_signup/src/components/navBar.dart';
// import 'package:flutter_login_signup/src/components/room_carosuel.dart';
// import 'package:flutter_login_signup/src/components/viewImg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: AppbarWidget(),
      ),
      drawer: NavDrawer(),
      body: Body(),
      bottomNavigationBar: bottombar(context),
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
      onPressed: () {
        // return Drawer(child: NavDrawer());
      },
    );
  }
}
