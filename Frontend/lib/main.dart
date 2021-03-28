import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/welcomePage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_login_signup/src/components/easyloading.dart';

void main() {
  runApp(MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      builder: EasyLoading.init(),
    );
  }
}
