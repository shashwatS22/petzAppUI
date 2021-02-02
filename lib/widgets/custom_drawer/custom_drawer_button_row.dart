import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/utils/app_icons.dart';

class CustomDrawerButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () {},
            child: Container(
              width: mq.width * 0.24,
              height: mq.width * 0.24,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(mq.height * 0.006),
                    height: mq.width * 0.12,
                    width: mq.width * 0.12,
                    child: Image.asset('assets/rehome.png'),
                  ),
                  Text("Re-Home",
                      style: GoogleFonts.poppins(
                          color: HexColor('#333333'),
                          fontSize: 14,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w400))
                ],
              ),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: HexColor('#E2E2E2'),
                        spreadRadius: mq.width * 0.005,
                        blurRadius: mq.width * 0.005)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(mq.width * 0.04)),
            )),
        SizedBox(
          width: mq.width * 0.06,
        ),
        Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(mq.height * 0.006),
                height: mq.width * 0.12,
                width: mq.width * 0.12,
                child: Image.asset('assets/mypets.png'),
              ),
              Text("My Pets",
                  style: GoogleFonts.poppins(
                      color: HexColor('#333333'),
                      fontSize: 14,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400))
            ],
          ),
          width: mq.width * 0.24,
          height: mq.width * 0.24,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: HexColor('#E2E2E2'),
                    spreadRadius: mq.width * 0.005,
                    blurRadius: mq.width * 0.005)
              ],
              borderRadius: BorderRadius.circular(mq.width * 0.04)),
        )
      ],
    );
  }
}
