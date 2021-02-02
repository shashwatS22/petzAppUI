import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomDrawerListElement extends StatelessWidget {
  final String text;
  final IconData icon;
  CustomDrawerListElement({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Container(
            width: mq.width * 0.057,
            height: mq.width * 0.057,
            child: Icon(
              icon,
              color: HexColor('#1A7D7D'),
            ),
          ),
          SizedBox(width: mq.width * 0.05),
          Container(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  color: HexColor('#333333'),
                  fontSize: 14,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(width: mq.width * 0.2),
          if (text == 'Help & Support')
            Container(
              width: mq.width * 0.057,
              height: mq.width * 0.057,
              child: Icon(
                Icons.arrow_drop_down_outlined,
              ),
            ),
        ],
      ),
    );
  }
}
