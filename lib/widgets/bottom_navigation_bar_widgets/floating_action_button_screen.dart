import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/screens/my_pets_screen.dart';
import 'package:petzapp_ui/utils/app_icons.dart';

class FloatingActionButtonScreen extends StatefulWidget {
  @override
  _FloatingActionButtonScreenState createState() =>
      _FloatingActionButtonScreenState();
}

class _FloatingActionButtonScreenState
    extends State<FloatingActionButtonScreen> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
        height: mq.height * 0.33,
        width: mq.width,
        decoration: BoxDecoration(
            //color: Colors.transparent,
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.topCenter,
                colors: [
              HexColor('#187C7C').withOpacity(0.4),
              Color.fromARGB(0, 255, 255, 255)
            ])),
        child: Container(
            height: mq.height * 0.3,
            width: mq.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: mq.width * 0.2,
                    height: mq.width * 0.2,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(mq.height * 0.006),
                          height: mq.width * 0.1,
                          width: mq.width * 0.11,
                          child: Icon(AppIcons.group_78,
                              color: HexColor('#187C7C'), size: mq.width * 0.1),
                        ),
                        Text("Re-Home",
                            style: GoogleFonts.poppins(
                                color: HexColor('#333333'),
                                fontSize: 12,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: HexColor('#E2E2E2'),
                              spreadRadius: mq.width * 0.005,
                              blurRadius: mq.width * 0.001)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(mq.width * 0.04)),
                  ),
                ),
                SizedBox(
                  width: mq.width * 0.06,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return MyPetsScreen();
                      },
                    ));
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(mq.height * 0.006),
                          height: mq.width * 0.1,
                          width: mq.width * 0.1,
                          child: Icon(AppIcons.group_78,
                              color: HexColor('#187C7C'), size: mq.width * 0.1),
                        ),
                        Text("My Pets",
                            style: GoogleFonts.poppins(
                                color: HexColor('#333333'),
                                fontSize: 12,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    width: mq.width * 0.2,
                    height: mq.width * 0.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: HexColor('#E2E2E2'),
                              spreadRadius: mq.width * 0.005,
                              blurRadius: mq.width * 0.001)
                        ],
                        borderRadius: BorderRadius.circular(mq.width * 0.04)),
                  ),
                )
              ],
            )));
  }
}
