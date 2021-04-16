import 'package:flutter/material.dart';
// import 'package:flutter_login_signup/src/addRoom.dart';
import 'package:flutter_login_signup/src/components/appbar.dart';
import 'package:flutter_login_signup/src/components/body.dart';
import 'package:flutter_login_signup/src/components/savedRooms.dart';
import 'package:flutter_login_signup/src/loginPage.dart';
// import 'package:flutter_login_signup/src/welcomePage.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  String startRange;
  String endRange;
  HomeScreen({Key key, this.startRange, this.endRange}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        // leading: AppbarWidget(),
      ),
      // drawer: Drawer(
      //   child: NavDrawer(),
      // ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // clipBehavior: Clip.hardEdge,
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  Icon(
                    Icons.person_pin_rounded,
                    size: 55,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Text(
                      'Welcome to the system',
                      style: TextStyle(
                        fontSize: 18.5,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              selectedTileColor: const Color.fromRGBO(10, 255, 15, 0.5),
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 18.5),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              selectedTileColor: const Color.fromRGBO(10, 255, 15, 0.5),
              leading: Icon(
                Icons.shopping_cart_rounded,
                color: Colors.black,
              ),
              title: Text(
                'Favourites',
                style: TextStyle(fontSize: 18.5),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SavedRooms()));
              },
            ),
            ListTile(
              selectedTileColor: const Color.fromRGBO(10, 255, 15, 0.5),
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text(
                'Settings',
                style: TextStyle(fontSize: 18.5),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              selectedTileColor: const Color.fromRGBO(10, 255, 15, 0.5),
              hoverColor: Colors.blue,
              leading: Icon(Icons.logout, color: Colors.black),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 18.5),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
            // SizedBox(
            //   height: 50,
            // ),
            // Text("@RENTAL APP ")
          ],
        ),
      ),
      body: Body(
        startPrice: widget.startRange,
        endPrice: widget.endRange,
      ),
      bottomNavigationBar: bottombar(context),
    );
  }
}

// class AppbarWidget extends StatelessWidget {
//   const AppbarWidget({
//     Key key,
//   }) : super(key: key);

// @override
// Widget build(BuildContext context) {
//   return IconButton(
//     icon: Icon(Icons.menu),
//     color: Colors.black,
//     onPressed: () {
//       Drawer(child: NavDrawer());
//     },
//   );
// }
// }
