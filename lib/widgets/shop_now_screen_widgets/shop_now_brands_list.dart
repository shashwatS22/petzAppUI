import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/shop_now_models.dart';
import 'package:petzapp_ui/widgets/shop_now_screen_widgets/shop_now_brands_list_item.dart';

class ShopNowBrandsList extends StatefulWidget {
  final List<Brand> brandsList;
  ShopNowBrandsList({this.brandsList});
  @override
  _ShopNowBrandsListState createState() => _ShopNowBrandsListState();
}

class _ShopNowBrandsListState extends State<ShopNowBrandsList> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    //print(widget.breedList);
    return Container(
      height: mq.height * 0.16,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.06),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Brands",
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: mq.height * 0.016),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: mq.width * 0.06),
              scrollDirection: Axis.horizontal,
              itemCount: widget.brandsList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    ShopNowBrandsListItem(brand: widget.brandsList[index]),
                    SizedBox(
                      width: mq.width * 0.02,
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
