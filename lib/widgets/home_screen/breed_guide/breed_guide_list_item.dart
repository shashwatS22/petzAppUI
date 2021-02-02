import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';

class BreedListItem extends StatefulWidget {
  final Breed breed;
  BreedListItem({this.breed});
  @override
  _BreedListItemState createState() => _BreedListItemState();
}

class _BreedListItemState extends State<BreedListItem> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
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
          height: mq.height * 0.4,
          width: mq.width * 0.45,
          child: InkWell(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(mq.height * 0.006),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://www.sciencemag.org/sites/default/files/styles/article_main_image_-_1280w__no_aspect_/public/dogs_1280p_0.jpg?itok=6jQzdNB8",
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 5,
                  child: Text(widget.breed.name,
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                Positioned(
                  bottom: 5,
                  left: 8,
                  child: Text(widget.breed.name,
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.white)),
                ),
                Positioned(
                  bottom: 5,
                  right: 10,
                  child: Text("Read More",
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.white)),
                ),
              ],
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
