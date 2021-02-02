import 'package:flutter/material.dart';
import 'package:petzapp_ui/widgets/petcare_screen/slider/slider_item.dart';

class CustomSlider extends StatefulWidget {
  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    return Container(
        height: 121,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  CustomSliderItem(
                    bodyColor: Color(0xffE0F1FF),
                    borderColor: Color(0xff42A8FC),
                    textColor: Color(0xff286EA8),
                    text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                    title: "Grooming",
                  ),
                  CustomSliderItem(
                    bodyColor: Color(0xffFFF1AC),
                    borderColor: Color(0xffC1731B),
                    textColor: Color(0xffC1721A),
                    text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                    title: "Stay",
                  ),
                  CustomSliderItem(
                    bodyColor: Color(0xffFFD2E1),
                    borderColor: Color(0xffFEB4CD),
                    textColor: Color(0xff2DADC7),
                    text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                    title: "Training",
                  ),
                  CustomSliderItem(
                    bodyColor: Color(0xffE5F4E7),
                    borderColor: Color(0xff33FC4C),
                    textColor: Color(0xff0CA720),
                    text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                    title: "Veterinarian",
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
