import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/shop_now_models.dart';

class ShopNowFeaturedListItem extends StatelessWidget {
  final Product product;
  ShopNowFeaturedListItem({this.product});
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 70),
        //height: mq.height * 0.3,
        // width: mq.width * 0.85,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          overflow: Overflow.visible,
          children: [
            Positioned(
              top: mq.height * 0.015,
              child: Container(
                width: mq.width * 0.41,
                height: mq.height * 0.135,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffD6D6D6),
                        blurRadius: 0.5, // soften the shadow
                        spreadRadius: 1.5, //extend the shadow
                      ),
                    ],
                    border: Border.all(color: Color(0xffD6D6D6), width: 1.2),
                    borderRadius: BorderRadius.circular(mq.width * 0.05),
                    color: Colors.white),
                child: Container(
                  padding: EdgeInsets.all(1),
                  // width: mq.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(product.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: mq.height * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "\u20B9${product.price.round() - (product.discount * 0.01 * product.price).toInt()}   ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Color(0xff333333)),
                          ),
                          Text(
                            "\u20B9${product.price.round()}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 12,
                                color: Colors.grey[500]),
                          ),
                          Text(
                            "  ${product.discount.round().toString()}% off",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff54BB65),
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      Container(
                        width: mq.width * 0.17,
                        padding: EdgeInsets.all(mq.width * 0.01),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(mq.width * 0.025),
                          color: Color(0xff1A7D7D),
                        ),
                        child: Center(
                          child: Text("ADD",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Positioned(
            //   bottom: mq.height * 0.04,
            //   right: mq.width * 0.06,
            //   child: Container(
            //     width: mq.width * 0.1,
            //     padding: EdgeInsets.all(mq.width * 0.01),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(mq.width * 0.025),
            //       color: Color(0xff1A7D7D"),
            //     ),
            //     child: Center(
            //       child: Text("Add",
            //           style: TextStyle(
            //               fontSize: 10, color: Colors.white)),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   top: mq.height * 0.04,
            //   right: mq.width * 0.08,
            // child: Container(
            //   width: mq.width * 0.4,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(product.title,
            //           style: TextStyle(
            //               fontSize: 12,
            //               color: Color(0xff333333"),
            //               fontWeight: FontWeight.w600)),
            //       SizedBox(
            //         height: mq.height * 0.005,
            //       ),
            //       Row(
            //         children: [
            //           Text(
            //             "\u20B9 ${product.price - (product.discount * 0.01 * product.price)}  ",
            //             style: TextStyle(
            //                 fontWeight: FontWeight.w600,
            //                 fontSize: 14,
            //                 color: Color(0xff333333")),
            //           ),
            //           Text(
            //             "\u20B9${product.price}",
            //             style: TextStyle(
            //                 decoration: TextDecoration.lineThrough,
            //                 fontSize: 10,
            //                 color: Colors.grey[500]),
            //           ),
            //           Text(
            //             "  ${product.discount.toString()} % off",
            //             style: TextStyle(
            //                 fontSize: 12, color: Colors.green),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // ),
            Positioned(
                top: -75,
                child: Container(
                    height: mq.height * 0.13,
                    width: mq.width * 0.35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffD6D6D6),
                            blurRadius: 0.5, // soften the shadow
                            spreadRadius: 0.5, //extend the shadow
                          ),
                        ],
                        border:
                            Border.all(color: Color(0xffD6D6D6), width: 1.2),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(product.primaryImage))))),
          ],
        ),
      ),
    );
  }
}
