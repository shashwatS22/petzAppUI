import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';

class PetListItem extends StatefulWidget {
  final Genus genus;
  PetListItem({this.genus});
  @override
  _PetListItemState createState() => _PetListItemState();
}

class _PetListItemState extends State<PetListItem> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    print(widget.genus.name);
    return GestureDetector(
      onTap: () {},
      child: AspectRatio(
        aspectRatio: 100 / 132,
        child: Container(
            // margin: EdgeInsets.symmetric(horizontal: mq.width * 0.018),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: HexColor('#D6D6D6'),
                    // blurRadius: 5.0, // soften the shadow
                    spreadRadius: 0.1, //extend the shadow
                  ),
                ],
                border: Border.all(color: HexColor('#D6D6D6'), width: 1.2),
                borderRadius: BorderRadius.all(
                  Radius.circular(mq.height * 0.012),
                ),
                color: Colors.white),
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            //padding: EdgeInsets.all(mq.height * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      // width: mq.width * 0.209,
                      // height: mq.width * 0.209,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(mq.height * 0.012),
                              topRight: Radius.circular(mq.height * 0.012)),
                          image: DecorationImage(
                              image: NetworkImage(
                                widget.genus.image,
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(top: mq.width * 0.01),
                      child: Text(
                        widget.genus.name,
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
