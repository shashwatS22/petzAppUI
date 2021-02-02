import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/screens/consultation_screen.dart';

class CustomRowItem extends StatelessWidget {
  final Icon icon;
  final String title;
  CustomRowItem({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              if (title == 'Veterinarian') {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return ConsultationScreen();
                  },
                ));
              }
            },
            child: Container(
              child: Center(child: icon),
              padding: EdgeInsets.all(mq.height * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                border: Border.all(color: HexColor('#D6D6D6')),
                color: Colors.white,
              ),
            )),
        Container(
          // padding: EdgeInsets.all(mq.height * 0.009),
          child: Text(title,
              style: GoogleFonts.poppins(
                  fontSize: 12, color: HexColor('#333333'))),
        )
      ],
    );
  }
}
