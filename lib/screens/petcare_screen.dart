import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/sample_data/sample_data.dart';
import 'package:petzapp_ui/widgets/bottom_navigation_bar_widgets/custom_bar.dart';
import 'package:petzapp_ui/widgets/bottom_navigation_bar_widgets/custom_floating_navigation_button.dart';
import 'package:petzapp_ui/widgets/button_row/button_row.dart';

import 'package:petzapp_ui/widgets/home_screen/search/search_bar.dart';
import 'package:petzapp_ui/widgets/petcare_screen/services_list_views/services_list_views.dart';
import 'package:petzapp_ui/widgets/petcare_screen/slider/slider.dart';

class PetCareScreen extends StatefulWidget {
  @override
  _PetCareScreenState createState() => _PetCareScreenState();
}

class _PetCareScreenState extends State<PetCareScreen> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Petcare",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xff333333),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActionButton(),
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(42), topRight: Radius.circular(42)),
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: mq.width * 0.034),
              color: Colors.grey[100],
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 27,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: mq.width * 0.05),
                      child: SearchBar(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: mq.width * 0.05),
                      child: CustomSlider(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ButtonRow(),
                    SizedBox(
                      height: 20,
                    ),
                    ServiceListViews(
                      serviceHomeData: SampleData.serviceHomeData,
                    ),
                    SizedBox(
                      height: mq.height * 0.1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
