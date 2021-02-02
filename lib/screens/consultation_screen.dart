import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/sample_data/sample_data.dart';
import 'package:petzapp_ui/widgets/bottom_navigation_bar_widgets/custom_bar.dart';
import 'package:petzapp_ui/widgets/bottom_navigation_bar_widgets/custom_floating_navigation_button.dart';
import 'package:petzapp_ui/widgets/consultation_screen_widgets/beat_covid_box.dart';
import 'package:petzapp_ui/widgets/consultation_screen_widgets/find_a_vet_box.dart';
import 'package:petzapp_ui/widgets/consultation_screen_widgets/image_text_column.dart';
import 'package:petzapp_ui/widgets/consultation_screen_widgets/recent_list.dart';

class ConsultationScreen extends StatefulWidget {
  @override
  _ConsultationScreenState createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  bool isTalkToDocPressed = false;
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
            "Consultation",
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
              width: mq.width,
              height: mq.height,
              color: Colors.grey[100],
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (isTalkToDocPressed == true)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28),
                            child: FindAVetBox(),
                          ),
                          SizedBox(height: 30),
                          RecentListView(
                            consultantList: SampleData.consultantList,
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    if (isTalkToDocPressed == false)
                      Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          ImageTextColumn(),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isTalkToDocPressed = true;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 184,
                              child: Center(
                                child: Text("Talk to Doctor",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffFFFFFF))),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17),
                                  color: Color(0xff1A7D7D)),
                            ),
                          ),
                          SizedBox(height: 63),
                        ],
                      ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28),
                      child: BeatCovidBox(),
                    ),
                    SizedBox(
                      height: 18,
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
