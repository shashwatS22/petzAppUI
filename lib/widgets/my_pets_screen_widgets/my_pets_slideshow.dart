import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';
import 'package:petzapp_ui/widgets/button_row/button_row.dart';
import 'package:petzapp_ui/widgets/my_pets_screen_widgets/my_pets_slideshow_center_row.dart';
import 'package:petzapp_ui/widgets/my_pets_screen_widgets/my_pets_slideshow_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyPetsSlideShow extends StatefulWidget {
  final List<Pet> petsList;
  MyPetsSlideShow({this.petsList});
  @override
  _MyPetsSlideShowState createState() => _MyPetsSlideShowState();
}

class _MyPetsSlideShowState extends State<MyPetsSlideShow> {
  final controller = PageController(viewportFraction: 0.85, initialPage: 1);
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          Center(
              child: Row(
            children: [
              //SizedBox(width: 18),
              Container(
                  height: 550,
                  width: mq.width,
                  // margin: EdgeInsets.all(18),
                  //width: 300,
                  child: PageView.builder(
                    itemCount: widget.petsList[0].media.length,
                    controller: controller,
                    itemBuilder: (context, index) {
                      return MyPetsSlideshowItem(
                        pet: widget.petsList[index],
                      );
                    },
                  )),
              // SizedBox(width: 18)
            ],
          )),
        ],
      ),
    );
  }
}
