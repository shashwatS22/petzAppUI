import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/sample_data/sample_data.dart';
import 'package:petzapp_ui/widgets/bottom_navigation_bar_widgets/custom_bar.dart';
import 'package:petzapp_ui/widgets/bottom_navigation_bar_widgets/custom_floating_navigation_button.dart';
import 'package:petzapp_ui/widgets/home_screen/breed_guide/breed_guide_list.dart';
import 'package:petzapp_ui/widgets/home_screen/search/search_bar.dart';
import '../widgets/breed_guide_screen_widgets/breed_guide_screen_rounded_slider.dart';
import '../widgets/breed_guide_screen_widgets/popular_breeds_list.dart';
import '../widgets/breed_guide_screen_widgets/indian_breed_list.dart';
import '../widgets/breed_guide_screen_widgets/foreign_breed_list.dart';

class BreedGuideScreen extends StatefulWidget {
  @override
  _BreedGuideScreenState createState() => _BreedGuideScreenState();
}

class _BreedGuideScreenState extends State<BreedGuideScreen> {
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
            "Breed Guide",
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 21,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: mq.width * 0.05),
                      child: SearchBar(),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    RoundedBreedSlider(
                      animalCategories: SampleData.animalCategoryList,
                    ),
                    PopularBreedsList(
                      breedList: SampleData.breedList,
                    ),
                    IndianBreedList(
                      breedList: SampleData.breedList,
                    ),
                    ForeignBreedList(
                      breedList: SampleData.breedList,
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
