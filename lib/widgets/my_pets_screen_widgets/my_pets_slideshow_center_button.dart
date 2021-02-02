import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';
import 'package:petzapp_ui/sample_data/sample_data.dart';
import 'package:petzapp_ui/widgets/my_pets_screen_widgets/my_pets_bottom_sheet.dart';

class SlideshowCenterButton extends StatelessWidget {
  final Icon icon;
  final Pet pet;
  SlideshowCenterButton({this.icon, this.pet});

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyPetsBottomSheet(
                  serviceHomeData: SampleData.serviceHomeData,
                  pet: pet,
                ),
              ));
            },
            child: Container(
              child: Center(child: icon),
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xffD6D6D6)),
                color: Colors.white,
              ),
            )),
      ],
    );
  }
}
