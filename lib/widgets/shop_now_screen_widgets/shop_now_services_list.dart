import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:petzapp_ui/widgets/shop_now_screen_widgets/shop_now_services_list_item.dart';

class ShopNowServicesList extends StatefulWidget {
  @override
  _ShopNowServicesListState createState() => _ShopNowServicesListState();
}

class _ShopNowServicesListState extends State<ShopNowServicesList> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    return Container(
        height: mq.height * 0.18,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  ShopNowServicesListItem(
                    colors: [
                      Color(0xff6A3BF5),
                      Color(0xff8962F6),
                    ],
                    image:
                        "https://toppng.com/adult-dog-cut-out-golden-retriever-PNG-free-PNG-Images_249191",
                  ),
                  SizedBox(
                    width: mq.width * 0.05,
                  ),
                  ShopNowServicesListItem(
                    colors: [
                      const Color.fromARGB(255, 240, 128, 128),
                      const Color.fromARGB(255, 241, 91, 181),
                    ],
                    image:
                        "https://toppng.com/adult-dog-cut-out-golden-retriever-PNG-free-PNG-Images_249191",
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
