import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';
import 'package:petzapp_ui/models/shop_now_models.dart';

class ShopNowBrandsListItem extends StatelessWidget {
  final Brand brand;
  ShopNowBrandsListItem({this.brand});

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 5, bottom: 10),
      child: Container(
        // height: mq.height * 0.1,
        width: mq.width * 0.35,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(brand.image), fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              color: Color(0xffD6D6D6),
              blurRadius: 0.4, // soften the shadow
              spreadRadius: 0.4, //extend the shadow
            ),
          ],
          border: Border.all(color: Color(0xffD6D6D6), width: 1.2),
          borderRadius: BorderRadius.all(
            Radius.circular(mq.height * 0.012),
          ),
        ),
      ),
    );
  }
}
