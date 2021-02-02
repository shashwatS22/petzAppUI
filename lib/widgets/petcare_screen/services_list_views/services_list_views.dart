import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/service_models.dart';
import 'package:petzapp_ui/utils/app_icons.dart';
import 'package:petzapp_ui/widgets/home_screen/services/services_list_item.dart';
import 'package:petzapp_ui/widgets/petcare_screen/services_list_views/services_list_view_item.dart';

class ServiceListViews extends StatefulWidget {
  final ServiceHomeData serviceHomeData;
  ServiceListViews({this.serviceHomeData});
  @override
  _ServiceListViewsState createState() => _ServiceListViewsState();
}

class _ServiceListViewsState extends State<ServiceListViews> {
  String categoryTitle, itemTitle;
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      //height: mq.height * 0.8,

      child: Column(
        children: [
          ListView.builder(
            // padding: EdgeInsets.symmetric(
            //     horizontal: mq.width * 0.03, vertical: mq.height * 0.03),
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: widget.serviceHomeData.categories.length,
            itemBuilder: (context, index) {
              categoryTitle = widget.serviceHomeData.categories[index].title;
              return Container(
                height: 273,
                //padding: EdgeInsets.symmetric(horizontal: mq.width * 0.034),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: mq.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.serviceHomeData.categories[index]
                                .title, //grooming
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff444444)),
                          ),
                          FlatButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    "See all ",
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xff187C7C)),
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
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: mq.width * 0.05),
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.serviceHomeData.providers.length,
                        itemBuilder: (context, index) {
                          itemTitle = widget
                              .serviceHomeData.providers[index].category.title;

                          return (categoryTitle == itemTitle)
                              ? Row(
                                  children: [
                                    ServicesListViewItem(
                                        provider: widget
                                            .serviceHomeData.providers[index]),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                )
                              : null;
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
