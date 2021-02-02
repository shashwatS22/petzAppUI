import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';
import './find_a_pet_rect_slider_item.dart';

class FindAPetRectSlider extends StatefulWidget {
  final List<AnimalCategory> animalCategories;
  FindAPetRectSlider({this.animalCategories});
  @override
  _FindAPetRectSliderState createState() => _FindAPetRectSliderState();
}

class _FindAPetRectSliderState extends State<FindAPetRectSlider> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    //print(widget.breedList);
    return Container(
      height: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
            child: Container(
              child: Text(
                "Find a pet",
                style: TextStyle(fontSize: 16, color: Color(0xff444444)),
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
              scrollDirection: Axis.horizontal,
              itemCount: widget.animalCategories.length,
              itemBuilder: (context, index) {
                return FindAPetRectSliderItem(
                    genus: widget.animalCategories[index].genus, index: index);
              },
            ),
          )
        ],
      ),
    );
  }
}
