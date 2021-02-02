import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';
import 'package:petzapp_ui/utils/app_icons.dart';
import './popular_breeds_list_item.dart';

class PopularBreedsList extends StatefulWidget {
  final List<Breed> breedList;
  PopularBreedsList({this.breedList});
  @override
  _PopularBreedsListState createState() => _PopularBreedsListState();
}

class _PopularBreedsListState extends State<PopularBreedsList> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    //print(widget.breedList);
    return Container(
      height: mq.height * 0.4,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
                child: Row(
                  children: [
                    Icon(
                      Icons.ac_unit,
                      size: 14,
                      color: Color(0xff187C7C),
                    ),
                    Text(" Popular Breed",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff444444),
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return PopularBreedListItem();
                      },
                    ));
                  },
                  child: Row(
                    children: [
                      Text(
                        "See all ",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff187C7C)),
                      ),
                      Icon(
                        AppIcons.path_73,
                        size: 10,
                        color: Color(0xff187C7C),
                      )
                    ],
                  ))
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
              scrollDirection: Axis.horizontal,
              itemCount: widget.breedList.length,
              itemBuilder: (context, index) {
                return PopularBreedListItem(
                  breed: widget.breedList[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
