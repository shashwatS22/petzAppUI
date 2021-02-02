import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';
import 'package:petzapp_ui/sample_data/sample_data.dart';
import 'package:petzapp_ui/utils/app_icons.dart';
import 'package:petzapp_ui/widgets/home_screen/find_pet/find_pet_list_item.dart';
import 'package:petzapp_ui/screens/find_a_pet_screen.dart';

class FindPetListView extends StatefulWidget {
  final List<AnimalCategory> animalCategoryList;
  FindPetListView({this.animalCategoryList});
  @override
  _FindPetListViewState createState() => _FindPetListViewState();
}

class _FindPetListViewState extends State<FindPetListView> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    print(widget.animalCategoryList);
    return Container(
      height: 165,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              // top: mq.height * 0.01,
              // bottom: mq.height * 0.01,
              right: mq.width * 0.05,
              left: mq.width * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Find a pet",
                    style: GoogleFonts.poppins(
                        fontSize: 20, color: HexColor('#444444'))),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FindAPetScreen(),
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
            child: MediaQuery.removePadding(
              removeLeft: true,
              removeRight: true,
              context: context,
              child: ListView.builder(
                padding: EdgeInsets.only(
                  left: mq.width * 0.05,
                ),
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                itemCount: widget.animalCategoryList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      PetListItem(
                          genus: widget.animalCategoryList[index].genus),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
