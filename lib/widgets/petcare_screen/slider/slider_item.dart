import 'package:flutter/material.dart';

class CustomSliderItem extends StatelessWidget {
  final Color borderColor;
  final Color bodyColor;
  final Color textColor;
  final String text;
  final String title;
  CustomSliderItem(
      {this.bodyColor,
      this.borderColor,
      this.text,
      this.title,
      this.textColor});
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: 359 / 121,
      child: Container(
        margin: EdgeInsets.only(right: mq.width * 0.03),
        // height: mq.height * 0.04,
        // width: mq.width * 0.86,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: bodyColor,
            border: Border.all(color: borderColor, width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: mq.width * 0.06,
                  ),
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: mq.width * 0.06),
                  //height: mq.height * 0.1,
                  width: mq.width * 0.6,
                  child: Text(
                    text,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Image.asset("assets/dog.png"),
                  height: mq.height * 0.1,
                  width: mq.width * 0.2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
