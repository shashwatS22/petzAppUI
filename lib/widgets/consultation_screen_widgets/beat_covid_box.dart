import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class BeatCovidBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      height: mq.height * 0.18,
      // width: mq.width * 0.91,
      //padding: EdgeInsets.all(mq.width * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: mq.height * 0.18,
            width: mq.width * 0.6,
            padding: EdgeInsets.only(left: mq.width * 0.05),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Beat COVID-19!",
                      style: TextStyle(
                          color: Color(0xff7D1917),
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                  Text("\u2022 Stay at home",
                      style: TextStyle(
                          color: Color(0xff7D1917),
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                  Text("\u2022 WASH your hands",
                      style: TextStyle(
                          color: Color(0xff7D1917),
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                  Text("\u2022 maintain SOCIAL DISTANCE",
                      style: TextStyle(
                          color: Color(0xff7D1917),
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(mq.width * 0.02),
                            border: Border.all(color: Color(0xff7D1917))),
                        height: mq.height * 0.035,
                        width: mq.width * 0.27,
                        child: Center(
                            child: Text(
                          'KNOW MORE',
                          style: TextStyle(
                              color: Color(0xff7D1917),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )),
                      ))
                ]),
          ),
          Container(
            width: mq.width * 0.1,
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Color(0xffFADDDD),
          borderRadius: BorderRadius.circular(mq.width * 0.05),
          border: Border.all(width: 2, color: Color(0xffFFC6C5))),
    );
  }
}
