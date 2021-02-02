import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';
import 'package:petzapp_ui/widgets/my_pets_screen_widgets/my_pets_other_list_item.dart';

class MyOtherPetsListView extends StatefulWidget {
  final List<Pet> petsList;
  MyOtherPetsListView({this.petsList});
  @override
  _MyOtherPetsListViewState createState() => _MyOtherPetsListViewState();
}

class _MyOtherPetsListViewState extends State<MyOtherPetsListView> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    //print(widget.breedList);
    return Container(
      height: mq.height * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: mq.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(left: mq.width * 0.03),
            child: Text(
              "My Other Pets",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff444444)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(mq.height * 0.01),
              scrollDirection: Axis.horizontal,
              itemCount: widget.petsList.length,
              itemBuilder: (context, index) {
                return MyOtherPetListItem(
                    pet: widget.petsList[index], index: index);
              },
            ),
          )
        ],
      ),
    );
  }
}
