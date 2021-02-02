import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/screens/complete_profile_screen.dart';
import 'package:petzapp_ui/screens/home_screen.dart';
import 'package:petzapp_ui/screens/intro_screen.dart';
import 'package:petzapp_ui/screens/login_screen.dart';
import 'package:petzapp_ui/screens/module_screen.dart';
import 'package:petzapp_ui/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        theme: ThemeData(
          buttonColor: Color(0xff187C7C),
          textTheme: GoogleFonts.poppinsTextTheme(),
        ));
  }
}
