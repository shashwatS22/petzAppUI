import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';
import 'breed__category_list_item.dart';

class IndianBreedList extends StatefulWidget {
  final List<Breed> breedList;
  IndianBreedList({this.breedList});

  @override
  _IndianBreedListState createState() => _IndianBreedListState();
}

class _IndianBreedListState extends State<IndianBreedList> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    //print(widget.breedList);
    return Container(
      height: mq.height * 0.7,
      // padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Indian Breed",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff444444),
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Column(
              // padding: EdgeInsets.all(mq.width * 0.03),
              //physics: ClampingScrollPhysics(),
              children: [
                for (Breed breed in widget.breedList.sublist(0, 3))
                  Column(
                    children: [
                      BreedCategoryListItem(breed: breed),
                      SizedBox(
                        height: mq.height * 0.01,
                      )
                    ],
                  )
              ],
              //padding: EdgeInsets.all(mq.height * 0.01),
            ),
          )
        ],
      ),
    );
  }
}
