import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/sample_data/sample_data.dart';
import 'package:petzapp_ui/widgets/bottom_navigation_bar_widgets/custom_bar.dart';
import 'package:petzapp_ui/widgets/bottom_navigation_bar_widgets/custom_floating_navigation_button.dart';
import 'package:petzapp_ui/widgets/home_screen/search/search_bar.dart';
import 'package:petzapp_ui/widgets/shop_now_screen_widgets/shop_now_brands_list.dart';
import 'package:petzapp_ui/widgets/shop_now_screen_widgets/shop_now_featured_list.dart';
import 'package:petzapp_ui/widgets/shop_now_screen_widgets/shop_now_food_category_list.dart';
import 'package:petzapp_ui/widgets/shop_now_screen_widgets/shop_now_rounded_slider.dart';
import 'package:petzapp_ui/widgets/shop_now_screen_widgets/shop_now_services_list.dart';

class ShopNowScreen extends StatefulWidget {
  @override
  _ShopNowScreenState createState() => _ShopNowScreenState();
}

class _ShopNowScreenState extends State<ShopNowScreen> {
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
            "Shop Now",
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
                      height: 40,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: mq.width * 0.05),
                      child: SearchBar(),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ShopNowServicesList(),
                    SizedBox(
                      height: 30,
                    ),
                    ShopNowRoundedSlider(
                      animalCategories: SampleData.animalCategoryList,
                    ),
                    FoodCategoryList(),
                    SizedBox(
                      height: 20,
                    ),
                    ShopNowBrandsList(
                      brandsList: SampleData.brandsList,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: mq.width * 0.05),
                      child: ShopNowFeaturedList(
                        productsList: SampleData.productsList,
                      ),
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
