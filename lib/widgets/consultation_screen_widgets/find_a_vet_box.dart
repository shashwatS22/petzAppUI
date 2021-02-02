import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class FindAVetBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      height: 121,
      //padding: EdgeInsets.only(left: mq.width * 0.04),
      //width: mq.width * 0.91,
      //padding: EdgeInsets.all(mq.width * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.only(left: mq.width * 0.04),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Find a vet",
                        style: TextStyle(
                            color: Color(0xff0BA71F),
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                    Text("Lorem ipsum dolor sit amet, consectetur",
                        style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                    GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff1A7D7D),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          height: 28,
                          width: 133,
                          child: Center(
                              child: Text(
                            'Talk to Doctor',
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          )),
                        ))
                  ]),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 78,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/module1.png'),
                      fit: BoxFit.cover)),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Color(0xffCEF6D3),
          borderRadius: BorderRadius.circular(mq.width * 0.05),
          border: Border.all(width: 2, color: Color(0xff50F867))),
    );
  }
}
