import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';
import 'package:petzapp_ui/widgets/shop_now_screen_widgets/shop_now_rounded_slider_item.dart';

class ShopNowRoundedSlider extends StatefulWidget {
  final List<AnimalCategory> animalCategories;
  ShopNowRoundedSlider({this.animalCategories});
  @override
  _ShopNowRoundedSliderState createState() => _ShopNowRoundedSliderState();
}

class _ShopNowRoundedSliderState extends State<ShopNowRoundedSlider> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    //print(widget.breedList);
    return Container(
      height: mq.height * 0.2,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "General",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: mq.height * 0.01,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: mq.width * 0.06),
              scrollDirection: Axis.horizontal,
              itemCount: widget.animalCategories.length,
              itemBuilder: (context, index) {
                return ShopNowRoundedSliderItem(
                    genus: widget.animalCategories[index].genus, index: index);
              },
            ),
          )
        ],
      ),
    );
  }
}
