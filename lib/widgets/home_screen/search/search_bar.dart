import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      // width: mq.width * 0.86,
      margin: EdgeInsets.only(
          //top: mq.height * 0.04,
          //bottom: mq.height * 0.04,
          //     right: mq.width * 0.056,
          //  left: mq.width * 0.056
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey[300],
        ),
        color: Colors.white,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search what you are looking for",
          icon: Container(
              margin: EdgeInsets.only(left: mq.width * 0.04),
              child: Icon(
                Icons.search,
                color: Colors.grey[600],
              )),
          hintStyle: TextStyle(fontSize: 14, color: Color(0xff999999)),
        ),
      ),
    );
  }
}
