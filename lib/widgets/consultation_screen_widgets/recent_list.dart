import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/consultations_models.dart';
import 'package:petzapp_ui/widgets/consultation_screen_widgets/recent_list_item.dart';

class RecentListView extends StatefulWidget {
  final List<Consultant> consultantList;
  RecentListView({this.consultantList});
  @override
  _RecentListViewState createState() => _RecentListViewState();
}

class _RecentListViewState extends State<RecentListView> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      height: 273,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              "Recent",
              style: TextStyle(
                  color: Color(0xff444444),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.consultantList.length,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 28),
              shrinkWrap: true,
              //padding: EdgeInsets.all(mq.height * 0.01),
              scrollDirection: Axis.horizontal,

              itemBuilder: (context, index) {
                return Row(
                  children: [
                    RecentListItem(
                      consultant: widget.consultantList[index],
                    ),
                    SizedBox(
                      width: mq.width * 0.02,
                    )
                  ],
                );
              },
            ),
          ),
          // SizedBox(
          //   height: mq.height * 0.05,
          // ),
        ],
      ),
    );
  }
}
