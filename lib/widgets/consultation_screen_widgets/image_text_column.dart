import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ImageTextColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: mq.height * 0.3,
          margin: EdgeInsets.symmetric(horizontal: 28),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/consultation.png'),
            ),
          ),
        ),
        Container(
          //height: mq.height * 0.05,
          width: mq.width * 0.65,

          child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Color(0xff333333))),
        ),
      ],
    );
  }
}
