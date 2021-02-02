import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';
import 'package:petzapp_ui/screens/home_screen.dart';
import 'package:petzapp_ui/screens/module_screen.dart';
import 'package:petzapp_ui/widgets/intro_screen_widgets/intro_container.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    final controller = PageController(viewportFraction: 1);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: mq.height * 0.15,
              ),
              Center(
                child: Container(
                  //padding: EdgeInsets.all(mq.width * 0.08),
                  height: 489,
                  width: mq.width,
                  child: PageView(
                    controller: controller,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: mq.width * 0.09,
                          ),
                          Container(
                            height: mq.height * 0.7,
                            width: mq.width * 0.82,
                            child: IntroContainer(
                              backGroundColorHex: "#FFEFEB",
                              description: "Look nowhere else",
                              image: "assets/intro1.png",
                              title: "Are you a pet lover",
                              titleColorHex: "#B9543A",
                            ),
                          ),
                          SizedBox(
                            width: mq.width * 0.09,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: mq.width * 0.09,
                          ),
                          Container(
                            height: mq.height * 0.7,
                            width: mq.width * 0.82,
                            child: IntroContainer(
                              backGroundColorHex: "#E6FFF1",
                              description:
                                  "Consult certified Veterinarians online",
                              image: "assets/intro2.png",
                              title: "Vet Consultation",
                              titleColorHex: "#22832F",
                            ),
                          ),
                          SizedBox(
                            width: mq.width * 0.09,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: mq.width * 0.09,
                          ),
                          Container(
                            height: mq.height * 0.7,
                            width: mq.width * 0.82,
                            child: IntroContainer(
                              backGroundColorHex: "#EBF3FA",
                              description:
                                  "Rehome your pet and animals to loving home",
                              image: "assets/intro3.png",
                              title: "Rehome",
                              titleColorHex: "#1C619D",
                            ),
                          ),
                          SizedBox(
                            width: mq.width * 0.09,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: mq.width * 0.09,
                          ),
                          Container(
                            height: mq.height * 0.7,
                            width: mq.width * 0.82,
                            child: IntroContainer(
                              backGroundColorHex: "#FFE3E2",
                              description: "Learn about each breed",
                              image: "assets/intro4.png",
                              title: "Breed Guide",
                              titleColorHex: "#A3281F",
                            ),
                          ),
                          SizedBox(
                            width: mq.width * 0.09,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: mq.width * 0.09,
                          ),
                          Container(
                            height: mq.height * 0.7,
                            width: mq.width * 0.82,
                            child: IntroContainer(
                              backGroundColorHex: "#EAF9FF",
                              description:
                                  "Manage your pet's schedule, certificates, medical history, and more.",
                              image: "assets/intro5.png",
                              title: "My Pets",
                              titleColorHex: "#1D6E8B",
                            ),
                          ),
                          SizedBox(
                            width: mq.width * 0.09,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 5,
                    effect: ExpandingDotsEffect(
                      dotWidth: mq.width * 0.03,
                      dotHeight: mq.width * 0.03,
                      activeDotColor: HexColor('#1A7D7D'),
                      expansionFactor: 3,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ModuleScreen(),
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: mq.width * 0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Skip ",
                            style: TextStyle(
                                color: HexColor('#999999'),
                                fontSize: 16,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500)),
                        Icon(
                          Icons.arrow_forward,
                          color: HexColor('#999999'),
                        )
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
