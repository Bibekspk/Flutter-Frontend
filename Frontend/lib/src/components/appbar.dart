import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/addRoom.dart';
import 'package:flutter_login_signup/src/homepage.dart';

AppBar homeAppBar(BuildContext context, String titleName) {
  return AppBar(
    backgroundColor: Colors.blueGrey[600],
    elevation: 0,
    title: Text(titleName),
    leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
          // showAlertDialog(context);
        }),
  );
}

Widget bottombar(BuildContext context) {
  return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromARGB(255, 0, 0, 0)),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outlined,
                color: Color.fromARGB(255, 0, 0, 0)),
            label: "Add Room")
      ],
      onTap: (index) {});
}

Scaffold homescrn() {
  return Scaffold(
    body: PageView(
      children: <Widget>[HomeScreen(), Roompage()],
    ),
  );
}

//================For Alert dialog buttons
showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Confirm"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Delete Drafts",
      style: TextStyle(
        color: Colors.red,
        fontSize: 20,
      ),
    ),
    content: Text("Would you like to remove all the drafts?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
