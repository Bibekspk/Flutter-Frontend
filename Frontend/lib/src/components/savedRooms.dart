import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SavedRooms extends StatefulWidget {
  @override
  _SavedRoomState createState() => _SavedRoomState();
}

class _SavedRoomState extends State<SavedRooms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Saved Rooms"),
            backgroundColor: Color.fromRGBO(13, 71, 161, 1)),
        body: SafeArea(
          child: _bodyContents(context),
        ));
  }

  Widget _bodyContents(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          child: Image(
                            fit: BoxFit.fill,
                            alignment: Alignment.topLeft,
                            image: NetworkImage(
                                "http://10.0.2.2:3000/multipropertyimage/1617507710605.jpg"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, top: 15, bottom: 8, right: 8),
                        child: Container(
                          width: size.width * 0.549,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "House For sale in Budnilkantha",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(r"Chuchepati, Kathmandu, Nepal"),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(r"Price$$$"),
                                    IconButton(
                                      icon: Icon(
                                        Icons.star,
                                        size: 25,
                                        color: Colors.yellow.shade600,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

//   Widget _secondContainer(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       width: size.width,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("This is second page"),
//           ],
//         ),
//       ),
//     );
//   }
// }

  Widget myDetailsContainer1(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Text(
              "Apartment",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text("Sale")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text("24, charkhal, Kathmandu"),
        Text("price: 20000/ Anna"),
        Row(
          children: [
            Text("posted: User Name"),
            SizedBox(
              width: 10,
            ),
            IconButton(
              icon: Icon(Icons.star),
              onPressed: () {
                print("object");
              },
            ),
          ],
        ),
      ],
    );
  }
}
