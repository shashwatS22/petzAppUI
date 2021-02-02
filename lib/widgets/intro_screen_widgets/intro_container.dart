import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class IntroContainer extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String backGroundColorHex;
  final String titleColorHex;
  IntroContainer(
      {this.backGroundColorHex,
      this.description,
      this.title,
      this.image,
      this.titleColorHex});

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: 338 / 489,
      child: Container(
        // height: mq.height * 0.8,
        // width: mq.width * 0.6,
        padding: EdgeInsets.all(mq.width * 0.1),
        decoration: BoxDecoration(
          color: HexColor(backGroundColorHex),
          borderRadius: BorderRadius.circular(mq.width * 0.2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: mq.height * 0.3,
                //width: mq.width * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.poppins(
                        color: HexColor(titleColorHex),
                        fontSize: 25,
                        fontWeight: FontWeight.w600)),
                Text(description,
                    style: GoogleFonts.poppins(
                        color: HexColor("#333333"),
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
