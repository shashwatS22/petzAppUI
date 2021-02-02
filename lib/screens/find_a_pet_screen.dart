import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/sample_data/sample_data.dart';
import 'package:petzapp_ui/widgets/bottom_navigation_bar_widgets/custom_bar.dart';
import 'package:petzapp_ui/widgets/bottom_navigation_bar_widgets/custom_floating_navigation_button.dart';
import 'package:petzapp_ui/widgets/find_a_pet_screen_widgets/find_a_pet_filterbox.dart';
import 'package:petzapp_ui/widgets/home_screen/search/search_bar.dart';
import 'package:petzapp_ui/widgets/find_a_pet_screen_widgets/find_a_pet_rect_slider.dart';
import 'package:petzapp_ui/widgets/find_a_pet_screen_widgets/find_a_pet_popular_breed_list.dart';
import 'package:petzapp_ui/widgets/find_a_pet_screen_widgets/foreign_breed_list.dart';
import 'package:petzapp_ui/widgets/find_a_pet_screen_widgets/indian_breed_list.dart';

class FindAPetScreen extends StatefulWidget {
  @override
  _FindAPetScreenState createState() => _FindAPetScreenState();
}

class _FindAPetScreenState extends State<FindAPetScreen> {
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 41.0),
              child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      barrierColor: Colors.black.withAlpha(1),
                      context: context,
                      builder: (context) => FindAPetFilterScreen(),
                    );
                  },
                  child: Icon(
                    Icons.filter_alt_outlined,
                    color: Color(0xff666666),
                  )),
            ),
            SizedBox(width: 10)
          ],
          backgroundColor: Colors.white,
          title: Text(
            "Find a pet",
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
              //padding: EdgeInsets.symmetric(horizontal: mq.width * 0.03),
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
                    FindAPetRectSlider(
                      animalCategories: SampleData.animalCategoryList,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FindAPetPopularList(
                      breedList: SampleData.breedList,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FindAPetIndianBreedList(
                      breedList: SampleData.breedList,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FindAPetForeignBreedList(
                      breedList: SampleData.breedList,
                    ),
                    SizedBox(
                      height: 30,
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
