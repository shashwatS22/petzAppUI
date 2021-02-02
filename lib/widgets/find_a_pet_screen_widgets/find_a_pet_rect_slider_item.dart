import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:petzapp_ui/models/core_models.dart';

class FindAPetRectSliderItem extends StatelessWidget {
  final Genus genus;
  final int index;
  FindAPetRectSliderItem({this.genus, this.index});
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (index == 0)
          Center(
            child: Container(
              decoration: DottedDecoration(
                  shape: Shape.box, color: Colors.green[300], strokeWidth: 2.5),
              child: Container(
                margin: EdgeInsets.all(3),
                height: 78,
                width: 78,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://www.sciencemag.org/sites/default/files/styles/article_main_image_-_1280w__no_aspect_/public/dogs_1280p_0.jpg?itok=6jQzdNB8"),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
        if (index != 0)
          Container(
            margin: EdgeInsets.all(5),
            height: 68,
            width: 68,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://www.sciencemag.org/sites/default/files/styles/article_main_image_-_1280w__no_aspect_/public/dogs_1280p_0.jpg?itok=6jQzdNB8"),
                  fit: BoxFit.cover,
                )),
          ),
      ],
    );
  }
}
