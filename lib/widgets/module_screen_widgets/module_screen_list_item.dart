import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ModuleListItem extends StatelessWidget {
  final String title;
  final String description;
  final String titleColor;
  final String backgroundColor;
  final String image;
  final String borderColor;
  ModuleListItem(
      {this.backgroundColor,
      this.borderColor,
      this.description,
      this.image,
      this.title,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          top: mq.width * 0.01, left: mq.width * 0.03, right: mq.width * 0.03),
      height: mq.height * 0.17,
      width: mq.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(mq.width * 0.03),
        color: HexColor(backgroundColor),
        //boxShadow: [BoxShadow(blurRadius: 2, spreadRadius: 2)]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 8,
            child: Container(
              // width: mq.width * 0.61,
              height: mq.height * 0.12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                        color: HexColor(titleColor),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                        color: HexColor('#333333'),
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              // width: mq.width * 0.15,
              //height: mq.width * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
          )
        ],
      ),
    );
  }
}
