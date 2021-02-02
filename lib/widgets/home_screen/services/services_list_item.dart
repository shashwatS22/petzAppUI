import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ServicesListItem extends StatelessWidget {
  final List<Color> colors;
  final String image;
  ServicesListItem({this.colors, this.image});

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: 358 / 148,
      child: Container(
        height: 148,
        margin: EdgeInsets.only(
            top: 30, left: mq.width * 0.04, right: mq.width * 0.04),
        child: GestureDetector(
          onTap: () {},
          child: Stack(
            fit: StackFit.loose,
            overflow: Overflow.visible,
            children: [
              Container(
                // height: mq.height * 0.3,
                // width: mq.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: HexColor('#D6D6D6'), width: 1.2),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,

                    colors: colors,
                    tileMode: TileMode
                        .repeated, // repeats the gradient over the canvas
                  ),
                ),
              ),
              Positioned(
                  top: 30,
                  left: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pet's Services",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: HexColor('#FFFFFF'),
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "We care for your pets",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: HexColor('#FFFFFF'),
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: mq.height * 0.01,
                      ),
                      Container(
                        height: 28,
                        width: 118,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            "View",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: HexColor('#FFFFFF'),
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  )),
              Positioned(
                child: Container(
                  height: mq.height * 0.3,
                  width: mq.width * 0.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/dog.png"),
                  )),
                ),
                bottom: -20,
                right: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
