import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/sample_data/sample_data.dart';
import 'package:petzapp_ui/widgets/bottom_navigation_bar_widgets/custom_bar.dart';
import 'package:petzapp_ui/widgets/bottom_navigation_bar_widgets/custom_floating_navigation_button.dart';
import 'package:petzapp_ui/widgets/my_pets_screen_widgets/my_pets_other_list.dart';
import 'package:petzapp_ui/widgets/my_pets_screen_widgets/my_pets_slideshow.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyPetsScreen extends StatefulWidget {
  @override
  _MyPetsScreenState createState() => _MyPetsScreenState();
}

class _MyPetsScreenState extends State<MyPetsScreen> {
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
            "My Pets",
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
              color: Colors.grey[100],
              height: mq.height,
              //padding: EdgeInsets.symmetric(horizontal: mq.width * 0.06),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyPetsSlideShow(
                      petsList: SampleData.petsList,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      child: Container(
                        height: 60,
                        width: 229,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(
                            width: 1,
                            color: Color(0xff1A7D7D),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                height: 40,
                                width: 40,
                                child:
                                    Image.asset('assets/add_pets_button.png')),
                            Text(
                              "Add Your Pets",
                              style: TextStyle(
                                  color: Color(0xff1A7D7D),
                                  fontSize: 16,
                                  letterSpacing: 0.96),
                            )
                          ],
                        ),
                      ),
                    )
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
//  Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: mq.height * 0.2,
//               ),
//               Center(
//                   child: Container(
//                       height: mq.width*0.8,
//                       width: mq.width*0.8,
//                       child: PageView(
//                         controller: controller,
//                         children: [
//                           Image.asset('assets/beagle.jpg'),
//                           Image.asset('assets/beagle.jpg'),
//                           Image.asset('assets/beagle.jpg')
//                         ],
//                       ))),
//               Center(
//                 child: Container(
//                   child: SmoothPageIndicator(
//                     controller: controller,
//                     count: 5,
//                     effect: ExpandingDotsEffect(
//                       dotWidth: mq.width * 0.03,
//                       dotHeight: mq.width * 0.03,
//                       activeDotColor: Color(0xff1A7D7D'),
//                       expansionFactor: 3,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
