import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/widgets/home_screen/services/services_list_item.dart';

class ServicesList extends StatefulWidget {
  @override
  _ServicesListState createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    PageController pageController = PageController();

    return Container(
        height: 180,
        child: PageView(
          pageSnapping: true,
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: [
            ServicesListItem(
              colors: [
                HexColor('#6A3BF5'),
                HexColor('#8962F6'),
              ],
              image:
                  "https://toppng.com/adult-dog-cut-out-golden-retriever-PNG-free-PNG-Images_249191",
            ),
            ServicesListItem(
              colors: [
                const Color.fromARGB(255, 240, 128, 128),
                const Color.fromARGB(255, 241, 91, 181),
              ],
              image:
                  "https://toppng.com/adult-dog-cut-out-golden-retriever-PNG-free-PNG-Images_249191",
            ),
          ],
        ));
  }
}
