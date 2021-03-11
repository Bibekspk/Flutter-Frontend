// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/components/body.dart';
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
