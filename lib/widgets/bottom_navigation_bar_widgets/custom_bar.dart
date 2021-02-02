import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/screens/complete_profile_screen.dart';
import 'package:petzapp_ui/screens/petcare_screen.dart';
import 'package:petzapp_ui/screens/shop_now_screen.dart';
import 'package:petzapp_ui/utils/app_icons.dart';
import 'package:petzapp_ui/widgets/bottom_navigation_bar_widgets/rectangular_notch.dart';

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return BottomAppBar(
      shape: AutomaticNotchedShape(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      notchMargin: 10,

      // notchMargin: 17,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(mq.width * 0.01),
        height: mq.height * 0.07,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(AppIcons.group_32,
                          size: 16, color: HexColor('#999999')),
                      Text("Home",
                          style: GoogleFonts.poppins(
                              fontSize: 10, color: HexColor('#999999'))),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return PetCareScreen();
                      },
                    ));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(AppIcons.group_31,
                          size: 16, color: HexColor('#999999')),
                      Text("Petcare",
                          style: GoogleFonts.poppins(
                              fontSize: 10, color: HexColor('#999999'))),
                    ],
                  ),
                ),
                SizedBox(width: mq.width * 0.04),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return ShopNowScreen();
                      },
                    ));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(AppIcons.shopping_cart,
                          size: 16, color: HexColor('#999999')),
                      Text("Shop",
                          style: GoogleFonts.poppins(
                              fontSize: 10, color: HexColor('#999999'))),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return CompleteProfileScreen();
                      },
                    ));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(AppIcons.group_30,
                          size: 16, color: HexColor('#999999')),
                      Text("Petzapp +",
                          style: GoogleFonts.poppins(
                              fontSize: 10, color: HexColor('#999999'))),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
