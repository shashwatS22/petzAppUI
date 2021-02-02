import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';

class ShopNowRoundedSliderItem extends StatelessWidget {
  final Genus genus;
  final int index;
  ShopNowRoundedSliderItem({this.genus, this.index});
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (index == 0)
          Center(
            child: Container(
              decoration: DottedDecoration(
                  shape: Shape.circle,
                  color: Colors.green[300],
                  strokeWidth: 2.5),
              child: Container(
                margin: EdgeInsets.all(mq.width * 0.01),
                height: mq.height * 0.1,
                width: mq.width * 0.2,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffD6D6D6),
                        blurRadius: 0.5, // soften the shadow
                        spreadRadius: 0.5, //extend the shadow
                      ),
                    ],
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://www.sciencemag.org/sites/default/files/styles/article_main_image_-_1280w__no_aspect_/public/dogs_1280p_0.jpg?itok=6jQzdNB8"),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
        if (index != 0)
          Container(
            margin: EdgeInsets.all(mq.width * 0.01),
            height: mq.height * 0.1,
            width: mq.width * 0.2,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffD6D6D6),
                    blurRadius: 0.5, // soften the shadow
                    spreadRadius: 0.5, //extend the shadow
                  ),
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://www.sciencemag.org/sites/default/files/styles/article_main_image_-_1280w__no_aspect_/public/dogs_1280p_0.jpg?itok=6jQzdNB8"),
                  fit: BoxFit.cover,
                )),
          ),
        SizedBox(
          height: mq.height * 0.005,
        ),
        Center(
          child: Text(genus.name + "s",
              style: TextStyle(fontSize: 12, color: Color(0xff181C1D))),
        ),
      ],
    );
  }
}
