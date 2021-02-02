import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/utils/app_icons.dart';

import 'custom_row_item.dart';

class ButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomRowItem(
          icon: Icon(
            AppIcons.group_43,
            color: HexColor('#187C7C'),
            size: 20,
          ),
          title: "Veterinarian",
        ),
        CustomRowItem(
          icon: Icon(
            AppIcons.group_43,
            color: HexColor('#187C7C'),
            size: 20,
          ),
          title: "Grooming",
        ),
        CustomRowItem(
          icon: Icon(
            AppIcons.group_6,
            color: HexColor('#187C7C'),
            size: 20,
          ),
          title: "Stays",
        ),
        CustomRowItem(
          icon: Icon(
            AppIcons.group_4,
            color: HexColor('#187C7C'),
            size: 20,
          ),
          title: "Training",
        ),
      ],
    );
  }
}
