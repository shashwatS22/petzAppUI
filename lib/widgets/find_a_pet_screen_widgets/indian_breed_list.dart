import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';
import 'package:petzapp_ui/utils/app_icons.dart';
import './find_a_pet_breed_list_item.dart';

class FindAPetIndianBreedList extends StatefulWidget {
  final List<Breed> breedList;
  FindAPetIndianBreedList({this.breedList});
  @override
  _FindAPetIndianBreedListState createState() =>
      _FindAPetIndianBreedListState();
}

class _FindAPetIndianBreedListState extends State<FindAPetIndianBreedList> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    //print(widget.breedList);
    return Container(
      height: 293,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Indian Breed",
                      style: TextStyle(fontSize: 16, color: Color(0xff444444)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: mq.height * 0.01,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.breedList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    FindAPetPopularListItem(
                      breed: widget.breedList[index],
                    ),
                    SizedBox(width: mq.width * 0.037),
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
