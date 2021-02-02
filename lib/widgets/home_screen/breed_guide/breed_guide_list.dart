import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';
import 'package:petzapp_ui/screens/breed_guide_screen.dart';
import 'package:petzapp_ui/utils/app_icons.dart';
import 'package:petzapp_ui/widgets/home_screen/breed_guide/breed_guide_list_item.dart';

class BreedGuideList extends StatefulWidget {
  final List<Breed> breedList;
  BreedGuideList({this.breedList});

  @override
  _BreedGuideListState createState() => _BreedGuideListState();
}

class _BreedGuideListState extends State<BreedGuideList> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    //print(widget.breedList);
    return Container(
      height: mq.height * 0.7,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              // top: mq.height * 0.01,
              //bottom: mq.height * 0.01,
              right: mq.width * 0.05,
              left: mq.width * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Breed Guide",
                    style: GoogleFonts.poppins(
                        fontSize: 20, color: HexColor('#444444'))),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return BreedGuideScreen();
                        },
                      ));
                    },
                    child: Row(
                      children: [
                        Text(
                          "See all ",
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: HexColor('#187C7C')),
                        ),
                        Icon(
                          AppIcons.path_73,
                          size: 10,
                          color: HexColor('#187C7C'),
                        )
                      ],
                    ))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              //padding: EdgeInsets.all(mq.height * 0.01),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                left: mq.width * 0.05,
              ),
              itemCount: widget.breedList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    BreedListItem(
                      breed: widget.breedList[index],
                    ),
                    SizedBox(
                      width: mq.width * 0.02,
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
