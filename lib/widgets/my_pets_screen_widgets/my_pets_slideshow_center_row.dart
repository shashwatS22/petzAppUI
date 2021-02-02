import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';
import 'package:petzapp_ui/utils/app_icons.dart';
import 'package:petzapp_ui/widgets/my_pets_screen_widgets/my_pets_slideshow_center_button.dart';

class CenterButtonRow extends StatelessWidget {
  final Pet pet;
  CenterButtonRow({this.pet});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideshowCenterButton(
          pet: pet,
          icon: Icon(
            AppIcons.group_43,
            color: Color(0xff187C7C),
            size: 18,
          ),
        ),
        SizedBox(
          width: 20,
        ),

        SlideshowCenterButton(
          pet: pet,
          icon: Icon(
            AppIcons.group_43,
            color: Color(0xff187C7C),
            size: 18,
          ),
        ),
        SizedBox(
          width: 20,
        ),

        SlideshowCenterButton(
          pet: pet,
          icon: Icon(
            AppIcons.group_43,
            color: Color(0xff187C7C),
            size: 18,
          ),
        ),
        // SlideshowCenterButton(
        //   icon: Icon(
        //     AppIcons.group_43,
        //     color: Color(0xff187C7C'),
        //     size: 16,
        //   ),
        // ),
      ],
    );
  }
}
