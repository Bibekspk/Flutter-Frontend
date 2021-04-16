import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/homepage.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  var selectedRange = RangeValues(3000, 30000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Filter Search"),
          backgroundColor: Color.fromRGBO(13, 71, 161, 1)),
      body: Container(
        margin: EdgeInsets.all(12),
        child: (Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 32,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Price Range",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
            RangeSlider(
              values: selectedRange,
              onChanged: (RangeValues newRange) {
                setState(() {
                  selectedRange = newRange;
                });
              },
              min: 3000,
              max: 30000,
              divisions: 27,
              labels: RangeLabels(
                selectedRange.start.round().toString(),
                selectedRange.end.round().toString(),
              ),
              activeColor: Colors.blueGrey[600],
              inactiveColor: Colors.grey[600],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  r"3K",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  r"30k",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                height: 60,
                width: 385,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                margin: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: RaisedButton(
                    textColor: Colors.white,
                    color: Color.fromRGBO(239, 108, 0, 0.9),
                    child: Text(
                      'Save Filter',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      // print("startRange" + startRange);
                      // print(endRange);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                    startRange:
                                        selectedRange.start.round().toString(),
                                    endRange:
                                        selectedRange.end.round().toString(),
                                  )));
                    })),
          ],
        )),
      ),
    );
  }

  Widget buildOption(String text, bool selected) {
    return Container(
      height: 40,
      width: 55,
      decoration: BoxDecoration(
        color: selected ? Colors.blue[900] : Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
        border: Border.all(
          width: selected ? 0 : 1,
          color: Colors.blueGrey[600],
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // Widget dropDownOption() {
  //   return Container(
  //     width: 500,
  //     child: DropdownButton<String>(
  //       value: dropdownValue,
  //       iconSize: 24,
  //       elevation: 16,
  //       style: TextStyle(color: Colors.blueGrey[600]),
  //       underline: Container(
  //         height: 2,
  //         color: Colors.blueGrey[600],
  //       ),
  //       onChanged: (String newValue) {
  //         setState(() {
  //           dropdownValue = newValue;
  //         });
  //       },
  //       items: <String>['House', 'Buildings', 'Apartment', 'Land']
  //           .map<DropdownMenuItem<String>>((String value) {
  //         return DropdownMenuItem<String>(
  //           value: value,
  //           child: Text(value),
  //         );
  //       }).toList(),
  //       icon: Icon(Icons.arrow_drop_down),
  //     ),
  //   );
  // }
}
