import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ShopNowServicesListItem extends StatelessWidget {
  final List<Color> colors;
  final String image;
  ShopNowServicesListItem({this.colors, this.image});

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      //height: mq.height * 0.8,
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          fit: StackFit.loose,
          overflow: Overflow.visible,
          children: [
            Container(
              height: mq.height * 0.3,
              width: mq.width * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xffD6D6D6), width: 1.2),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,

                  colors: colors,
                  tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
            ),
            Positioned(
                top: 30,
                left: 15,
                child: Column(
                  children: [
                    Text(
                      "Pet's Services",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "We care for your pets",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: mq.height * 0.01,
                    ),
                    Container(
                      height: mq.height * 0.04,
                      width: mq.width * 0.2,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "View",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffFFFFFF),
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
              bottom: 5,
              right: 20,
            )
          ],
        ),
      ),
    );
  }
}
