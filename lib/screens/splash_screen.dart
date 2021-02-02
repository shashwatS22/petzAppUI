import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/screens/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return IntroScreen();
          },
        ));
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Container(
                        height: mq.height * 0.2,
                        width: mq.height * 0.2,
                        child: Image.asset('assets/logo.png'))),
                Center(
                  child: Container(
                    child: Text(" Petzapp",
                        style: TextStyle(
                            color: HexColor('#333333'),
                            fontSize: 25,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
