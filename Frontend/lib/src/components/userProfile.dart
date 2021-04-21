import 'package:flutter/material.dart';
import 'package:flutter_login_signup/api/userProfileapi.dart';
import 'package:flutter_login_signup/models/userModel.dart';
import 'package:flutter_login_signup/src/components/editProfile.dart';
import 'package:flutter_session/flutter_session.dart';

class ProfileEightPage extends StatefulWidget {
  @override
  _ProfileEightPageState createState() => _ProfileEightPageState();
}

class _ProfileEightPageState extends State<ProfileEightPage> {
  List<UserData> _user = [];
  bool _loading;
  var session = FlutterSession();

  @override
  void initState() {
    _loading = true;
    super.initState();
    UserServices.getUserInfo().then((user) {
      setState(() {
        _user = user;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color.fromRGBO(66, 133, 255, 1),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // GestureDetector(
                //   onTap: () {},
                //   //   print('This is see more');
                //   //   Navigator.push(context,
                //   //       // MaterialPageRoute(builder: (context) => ListviewPage()));
                //   // },
                // ),
              ],
            ),
          ),
          Container(
            height: 500,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            // color: Colors.grey,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _user.length == null ? 0 : _user.length,
              itemBuilder: (BuildContext context, int index) {
                UserData user = _user[index];
                return GestureDetector(
                    // onTap: () {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) =>
                    //               PropertyListsView(room: room)));

                    //   session.set("room_id", room.roomId);
                    //   // session.set("user_id", room.userId);
                    //   print("Property_ID ==>" + room.roomId.toString());
                    //   print("User ==> " + room.userId.toString());
                    // },
                    child: Card(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        ProfileHeader(
                          avatar: NetworkImage(
                              "https://image.shutterstock.com/image-vector/user-icon-trendy-flat-style-600w-1467725033.jpg"),
                          coverImage: NetworkImage(
                              "https://media.istockphoto.com/photos/silhouette-of-business-people-work-together-in-office-concept-of-and-picture-id1132079855?s=612x612"),
                          title: user.name,
                          subtitle: "App User",
                          actions: <Widget>[
                            MaterialButton(
                              color: Colors.white,
                              shape: CircleBorder(),
                              elevation: 0,
                              child: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditProfile()));
                              },
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ...ListTile.divideTiles(
                              color: Colors.grey,
                              tiles: [
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  leading: Icon(
                                    Icons.my_location,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    "Location",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  subtitle: Text(
                                    user.address,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18),
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(Icons.email),
                                  title: Text(
                                    "Email",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  subtitle: Text(
                                    user.email,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18),
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(Icons.phone),
                                  title: Text(
                                    "Phone",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  subtitle: Text(user.contact,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18)),
                                ),
                                ListTile(
                                  leading: Icon(Icons.person),
                                  title: Text(
                                    "About Me",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  subtitle: Text(
                                    "This is a about me link and you can khow about me in this section.",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final ImageProvider<dynamic> coverImage;
  final ImageProvider<dynamic> avatar;
  final String title;
  final String subtitle;
  final List<Widget> actions;

  const ProfileHeader(
      {Key key,
      @required this.coverImage,
      @required this.avatar,
      @required this.title,
      this.subtitle,
      this.actions})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Ink(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(image: coverImage, fit: BoxFit.cover),
          ),
        ),
        Ink(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black38,
          ),
        ),
        if (actions != null)
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(bottom: 0.0, right: 0.0),
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions,
            ),
          ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 160),
          child: Column(
            children: <Widget>[
              Avatar(
                image: avatar,
                radius: 40,
                backgroundColor: Colors.white,
                borderColor: Colors.grey.shade300,
                borderWidth: 4.0,
              ),
              Text(title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              if (subtitle != null) ...[
                const SizedBox(height: 5.0),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ]
            ],
          ),
        )
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  final ImageProvider<dynamic> image;
  final Color borderColor;
  final Color backgroundColor;
  final double radius;
  final double borderWidth;

  const Avatar(
      {Key key,
      @required this.image,
      this.borderColor = Colors.grey,
      this.backgroundColor,
      this.radius = 30,
      this.borderWidth = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + borderWidth,
      backgroundColor: borderColor,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor != null
            ? backgroundColor
            : Theme.of(context).primaryColor,
        child: CircleAvatar(
          radius: radius - borderWidth,
          backgroundImage: image,
        ),
      ),
    );
  }
}
