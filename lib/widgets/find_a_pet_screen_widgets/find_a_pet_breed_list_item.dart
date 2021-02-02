import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';
import 'package:petzapp_ui/utils/app_icons.dart';

class FindAPetPopularListItem extends StatelessWidget {
  final Breed breed;
  FindAPetPopularListItem({this.breed});
  @override
  Widget build(BuildContext context) {
    @override
    var mq = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: AspectRatio(
        aspectRatio: 168 / 254,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffD6D6D6),
                  // blurRadius: 5.0, // soften the shadow
                  spreadRadius: 0.1, //extend the shadow
                ),
              ],
              border: Border.all(color: Color(0xffD6D6D6), width: 1.2),
            ),

            //padding: EdgeInsets.all(mq.height * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: AspectRatio(
                    aspectRatio: 168 / 144,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://www.sciencemag.org/sites/default/files/styles/article_main_image_-_1280w__no_aspect_/public/dogs_1280p_0.jpg?itok=6jQzdNB8"),
                          )),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: mq.width * 0.02, bottom: mq.width * 0.01),
                  child: Text(
                    "Tony",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff444444)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: mq.width * 0.03, bottom: mq.width * 0.01),
                  child: Text(
                    breed.name,
                    style: TextStyle(
                        // fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xff444444)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: mq.width * 0.03, bottom: mq.width * 0.01),
                  child: Text(
                    breed.slug,
                    style: TextStyle(
                        // fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Color(0xff777777)),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: mq.width * 0.01, top: mq.width * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          AppIcons.path_46,
                          color: Color(0xff187C7C),
                          size: 14,
                        ),
                        Text(
                          "  Distance: 6 km",
                          style: TextStyle(
                              // fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Color(0xff444444)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
