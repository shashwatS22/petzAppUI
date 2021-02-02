import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';

class BreedCategoryListItem extends StatelessWidget {
  final Breed breed;
  BreedCategoryListItem({this.breed});
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: mq.height * 0.2,
        padding: EdgeInsets.symmetric(horizontal: mq.width * 0.048),
        child: Stack(
          fit: StackFit.loose,
          overflow: Overflow.visible,
          children: [
            Positioned(
              top: mq.height * 0.015,
              child: Container(
                width: mq.width * 0.9,
                height: mq.height * 0.17,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffD6D6D6),
                        blurRadius: 0.5, // soften the shadow
                        spreadRadius: 0.5, //extend the shadow
                      ),
                    ],
                    border: Border.all(color: Color(0xffD6D6D6), width: 1.2),
                    borderRadius: BorderRadius.circular(mq.width * 0.05),
                    color: Colors.white),
                child: Container(),
              ),
            ),
            Positioned(
              bottom: mq.height * 0.03,
              right: mq.width * 0.09,
              child: Text("read more",
                  style: TextStyle(fontSize: 12, color: Color(0xff1A7D7D))),
            ),
            Positioned(
              top: mq.height * 0.04,
              right: mq.width * 0.14,
              child: Container(
                width: mq.width * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(breed.name,
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff333333),
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: mq.height * 0.02,
                    ),
                    Text(
                      breed.slug,
                      style: TextStyle(fontSize: 12, color: Color(0xff333333)),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                left: 0,
                child: Container(
                  height: mq.height * 0.2,
                  width: mq.height * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffD6D6D6),
                          blurRadius: 0.5, // soften the shadow
                          spreadRadius: 0.5, //extend the shadow
                        ),
                      ],
                      border: Border.all(color: Color(0xffD6D6D6), width: 1.2),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://www.sciencemag.org/sites/default/files/styles/article_main_image_-_1280w__no_aspect_/public/dogs_1280p_0.jpg?itok=6jQzdNB8"))),
                )),
          ],
        ),
      ),
    );
  }
}
