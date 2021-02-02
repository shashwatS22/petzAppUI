import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/utils/app_icons.dart';
import 'package:petzapp_ui/widgets/custom_drawer/custom_drawer_button_row.dart';
import 'package:petzapp_ui/widgets/custom_drawer/custom_drawer_list_element.dart';

class CustomDrawerScreen extends StatefulWidget {
  @override
  _CustomDrawerScreenState createState() => _CustomDrawerScreenState();
}

class _CustomDrawerScreenState extends State<CustomDrawerScreen> {
  List<String> listElementNames = [
    'Breed Guide',
    'Find a Pet',
    'Shop Now',
    'Petcare',
    'Notification',
    'Help & Support',
    'Share the app',
    'Rate the app',
    'About',
    'Videos',
    'Logout'
  ];
  List<IconData> listElementIcons = [
    AppIcons.group_203,
    AppIcons.group_222,
    AppIcons.group_221,
    AppIcons.group_228,
    AppIcons.group_225,
    AppIcons.group_224,
    AppIcons.group_227,
    AppIcons.group_223,
    AppIcons.group_226,
    Icons.video_label,
    Icons.logout,
  ];
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.all(mq.width * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: mq.height * 0.05,
                      width: mq.height * 0.05,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo.png'))),
                    ),
                    Container(
                      child: Text(" Petzapp",
                          style: TextStyle(
                              color: Color(0xff0B4A4A),
                              fontSize: 20,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.04,
              ),
              CustomDrawerButtonRow(),
              SizedBox(height: mq.height * 0.02),
              for (int i = 0; i < 5; i++)
                Column(
                  children: [
                    CustomDrawerListElement(
                      text: listElementNames[i],
                      icon: listElementIcons[i],
                    ),
                    SizedBox(height: mq.height * 0.02)
                  ],
                ),
              SizedBox(height: mq.height * 0.02),
              for (int i = 5; i < 10; i++)
                Column(
                  children: [
                    CustomDrawerListElement(
                      text: listElementNames[i],
                      icon: listElementIcons[i],
                    ),
                    SizedBox(height: mq.height * 0.02)
                  ],
                ),
              SizedBox(height: mq.height * 0.05),
              CustomDrawerListElement(
                text: listElementNames[10],
                icon: listElementIcons[10],
              ),
              SizedBox(height: mq.height * 0.05),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Terms & Conditions   |   Policies',
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 12,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
