import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_login_signup/src/components/appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_session/flutter_session.dart';

class Viewimg extends StatefulWidget {
  @override
  _ViewimgState createState() => _ViewimgState();
}

class _ViewimgState extends State<Viewimg> {
  List imageNameList = [];
  Future<String> getImageData() async {
    final String url = "http://10.0.2.2:5000/v2/getMultipleimg/50";
    var response = await http.get(
      //Encode the url
      Uri.encodeFull(url),
      //Only accepts json response
      headers: {"Accept": "application/json"},
    );

    setState(() {
      var convertDataToJson = json.decode(response.body);
      imageNameList = convertDataToJson['name'];
    });

    print(imageNameList);
    return "success";
  }

  PageController pageController;
  @override
  // @override
  void initState() {
    super.initState();
    getImageData();
    pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  imageSlider(int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 200,
            width: Curves.easeInOut.transform(value) * 350,
            child: widget,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(3),
        child: Image.network(
          imageNameList[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: homeAppBar(),
      // backgroundColor: Colors.black87,
      body: SafeArea(
        child: PageView.builder(
            itemBuilder: (context, position) {
              return imageSlider(position);
            },
            controller: pageController,
            itemCount: imageNameList.length),
      ),
    );
  }
}
