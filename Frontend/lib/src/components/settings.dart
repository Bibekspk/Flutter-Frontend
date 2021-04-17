import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/components/listedRooms.dart';
import 'package:flutter_login_signup/src/components/userProfile.dart';
// import 'package:flutter_login_signup/src/components/userProfile.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter_ui_challenges/core/presentation/res/assets.dart';
// import 'package:flutter_ui_challenges/src/pages/invitation/inlanding.dart';

class SettingsTwoPage extends StatelessWidget {
  static final String path = "lib/src/pages/settings/settings2.dart";
  final TextStyle whiteText =
      TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
  final TextStyle greyTExt = TextStyle(
    color: Colors.grey.shade900,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color.fromRGBO(66, 133, 255, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30.0, 0, 30, 0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Settings",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        "User Settings",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Card(
              shadowColor: Colors.blueGrey.shade900,
              child: ListTile(
                title: Text(
                  "Languages",
                  style: whiteText,
                ),
                subtitle: Text(
                  "English US",
                  style: greyTExt,
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  "Profile Settings",
                  style: whiteText,
                ),
                subtitle: Text(
                  "User",
                  style: greyTExt,
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileEightPage()));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  "Contact Us",
                  style: whiteText,
                ),
                subtitle: Text(
                  "Rental App",
                  style: greyTExt,
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  "Listed Rooms",
                  style: whiteText,
                ),
                subtitle: Text(
                  "Rooms",
                  style: greyTExt,
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListedRooms()));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  "Logout",
                  style: whiteText,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
