import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/sample_data/sample_data.dart';
import 'package:petzapp_ui/screens/custom_drawer_screen.dart';
import 'package:petzapp_ui/widgets/bottom_navigation_bar_widgets/custom_bar.dart';
import 'package:petzapp_ui/widgets/bottom_navigation_bar_widgets/custom_floating_navigation_button.dart';
import 'package:petzapp_ui/widgets/button_row/button_row.dart';
import 'package:petzapp_ui/widgets/home_screen/app_bar/custom_app_bar.dart';
import 'package:petzapp_ui/widgets/home_screen/breed_guide/breed_guide_list.dart';

import 'package:petzapp_ui/widgets/home_screen/find_pet/find_pet_list.dart';
import 'package:petzapp_ui/widgets/home_screen/search/search_bar.dart';
import 'package:petzapp_ui/widgets/home_screen/services/services_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<InnerDrawerState> innerDrawerKey =
      GlobalKey<InnerDrawerState>();

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return InnerDrawer(
      key: innerDrawerKey,
      boxShadow: [
        BoxShadow(
            color: HexColor('#AFAFAF'),
            blurRadius: mq.width * 0.02,
            spreadRadius: mq.width * 0.02),
      ],
      onTapClose: true, // default false
      swipe: true, // default true
      colorTransitionChild: HexColor('#F2F2F2'), // default Color.black54
      colorTransitionScaffold:
          HexColor('#F2F2F2').withOpacity(0.5), // default Color.black54

      //When setting the vertical offset, be sure to use only top or bottom
      offset: IDOffset.only(bottom: 0, right: 0.0, left: 0.68),

      scale: IDOffset.only(left: 0.8), // set the offset in both directions

      //proportionalChildArea: true, // default true
      borderRadius: mq.width * 0.06, // default 0
      leftAnimationType: InnerDrawerAnimation.static, // default static
      rightAnimationType: InnerDrawerAnimation.quadratic,
      backgroundDecoration: BoxDecoration(
          color: HexColor(
              '#F2F2F2')), // default  Theme.of(context).backgroundColor

      //when a pointer that is in contact with the screen and moves to the right or left
      onDragUpdate: (double val, InnerDrawerDirection direction) {
        // return values between 1 and 0
        print(val);
        // check if the swipe is to the right or to the left
        print(direction == InnerDrawerDirection.start);
      },

      innerDrawerCallback: (a) =>
          print(a), // return  true (open) or false (close)
      leftChild: CustomDrawerScreen(), // required if rightChild is n
      scaffold: Scaffold(
        extendBody: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(mq.height * 0.15),
          child: CustomAppBar(
            innerDrawerKey: innerDrawerKey,
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
                //padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: mq.width * 0.04),
                        child: SearchBar(),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ServicesList(),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: mq.width * 0.04),
                        child: ButtonRow(),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      FindPetListView(
                        animalCategoryList: SampleData.animalCategoryList,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      BreedGuideList(
                        breedList: SampleData.breedList,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
