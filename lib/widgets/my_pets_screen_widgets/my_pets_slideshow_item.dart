import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';

import 'my_pets_slideshow_center_row.dart';

class MyPetsSlideshowItem extends StatelessWidget {
  final Pet pet;
  MyPetsSlideshowItem({this.pet});
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.loose,
      overflow: Overflow.visible,
      children: [
        Positioned(
          bottom: 0,
          right: 7.5,
          child: Container(
            height: 350,
            width: 320,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffB9E89A), Color(0xff569391)]),
              borderRadius: BorderRadius.circular(17),
              border: Border.all(color: Color(0xffD6D6D6), width: 1.2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("Jerry",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                        Text("Beagle dog",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Sex : Male',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w300)),
                        Text("Age : 6 months",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: CenterButtonRow(pet: pet),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 314,
          height: 410,
          margin: EdgeInsets.all(18),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // boxShadow: [
              //   BoxShadow(
              //     color: Color(0xffD6D6D6'),
              //     blurRadius: 5, // soften the shadow
              //     spreadRadius: 5, //extend the shadow
              //   ),
              // ],
              // border: Border.all(color: Color(0xffD6D6D6'), width: 1.2),
              image: DecorationImage(
                  image: AssetImage(pet.media[0].file), fit: BoxFit.cover)),
        ),
      ],
    );
  }
}
