import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/shop_now_models.dart';
import 'package:petzapp_ui/widgets/shop_now_screen_widgets/shop_now_featured_list_item.dart';

class ShopNowFeaturedList extends StatefulWidget {
  final List<Product> productsList;
  ShopNowFeaturedList({this.productsList});
  @override
  _ShopNowFeaturedListState createState() => _ShopNowFeaturedListState();
}

class _ShopNowFeaturedListState extends State<ShopNowFeaturedList> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    //print(widget.breedList);
    return Container(
      height: mq.height * 0.9,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Featured",
              style: TextStyle(fontSize: 20, color: Color(0xff444444)),
            ),
          ),
          SizedBox(height: mq.height * 0.016),
          Expanded(
            child: GridView.builder(
              //padding: EdgeInsets.only(top: 30),

              itemCount: widget.productsList.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 28,
              ),
              itemBuilder: (context, index) {
                return ShopNowFeaturedListItem(
                    product: widget.productsList[index]);
              },
            ),
            // child: Column(
            //padding: EdgeInsets.all(mq.height * 0.01),
            // children: [
            //   for (Product product in widget.productsList.sublist(0, 3))
            //     Row(
            //       children: [
            //         ShopNowFeaturedListItem(product: product),

            //       ],
            //     )
            // ],
          ),
          // SizedBox(
          //   height: 60,
          // )
        ],
      ),
    );
  }
}
