import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/consultations_models.dart';
import 'package:petzapp_ui/utils/app_icons.dart';

class RecentListItem extends StatelessWidget {
  final Consultant consultant;
  RecentListItem({this.consultant});
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: AspectRatio(
        aspectRatio: 168 / 235,
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

            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            //padding: EdgeInsets.all(mq.height * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Center(
                      child: AspectRatio(
                        aspectRatio: 168 / 144,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(consultant.photo),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        height: 24,
                        width: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color(0xffD6D6D6),
                        ),
                        child: Center(
                            child: Text(
                          'Closed',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff444444)),
                        )),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: mq.width * 0.02, bottom: mq.width * 0.01),
                  child: Text(
                    consultant.name,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff444444)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    bottom: mq.width * 0.01,
                  ),
                  child: RatingBarIndicator(
                    rating: consultant.rating,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Color(0xff1A7D7D),
                    ),
                    itemCount: 4,
                    itemPadding: EdgeInsets.only(right: 21.19),
                    itemSize: mq.height * 0.02,
                    direction: Axis.horizontal,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: mq.width * 0.02, top: mq.width * 0.01),
                  child: Text(
                    "11:03 AM Dec 20",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff888888),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
