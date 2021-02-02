import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';
import 'package:petzapp_ui/models/service_models.dart';
import 'package:petzapp_ui/utils/app_icons.dart';

class MyPetsBottomSheet extends StatefulWidget {
  final ServiceHomeData serviceHomeData;
  final Pet pet;
  MyPetsBottomSheet({this.serviceHomeData, this.pet});
  @override
  _MyPetsBottomSheetState createState() => _MyPetsBottomSheetState();
}

class _MyPetsBottomSheetState extends State<MyPetsBottomSheet> {
  List<String> gridNames = [
    'Schedule',
    'Food & Diet',
    'Appointments',
    'Health Record',
    'Consultations',
    'Certificates',
    'Pet Gallery',
    'Shop'
  ];
  List<IconData> gridIcons = [
    AppIcons.group_2689,
    AppIcons.group_2690,
    AppIcons.group_2691,
    AppIcons.group_2647,
    AppIcons.group_43,
    AppIcons.group_2693,
    AppIcons.group_2694,
    AppIcons.group_2695
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.white,
          title: Text(
            "My Pets",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xff333333),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.pet.media[0].file),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.66,
              // padding: EdgeInsets.symmetric(
              //   horizontal: 28,
              //   vertical: 20,
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jerry",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Beagle dog",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Sex : Male',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              "Age : 6 months",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    flex: 3,
                    child: GridView(
                      padding: EdgeInsets.symmetric(horizontal: 28),
                      physics: ClampingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      children: [
                        for (int i = 0; i < gridNames.length; i++)
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffE6E6E6),
                                      spreadRadius: 3,
                                      blurRadius: 3,
                                    )
                                  ],
                                ),
                                child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: <Color>[
                                        Color(0xffFFEF1F),
                                        Color(0xffE0252A),
                                      ],
                                    ).createShader(bounds);
                                  },
                                  child: Icon(
                                    gridIcons[i],
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                child: Text(
                                  gridNames[i],
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Service Requests",
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xff444444))),
                              FlatButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Text(
                                        "See all ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff187C7C)),
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
                            padding: EdgeInsets.symmetric(
                              horizontal: 65,
                            ),
                            scrollDirection: Axis.horizontal,
                            physics: ClampingScrollPhysics(),
                            itemCount: widget.serviceHomeData.providers.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  ServiceListItem(
                                    provider:
                                        widget.serviceHomeData.providers[index],
                                  ),
                                  SizedBox(
                                    width: 50,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceListItem extends StatelessWidget {
  final Provider provider;
  ServiceListItem({this.provider});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        fit: StackFit.loose,
        overflow: Overflow.visible,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              border: Border.all(
                color: Color(0xffE7E7E7),
                width: 1,
              ),
            ),
            height: 97,
            width: 192,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      provider.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      provider.description,
                      style: TextStyle(fontSize: 12, color: Color(0xff777777)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                    ),
                    GestureDetector(
                      child: Container(
                        height: 22,
                        width: 77,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Color(0xff059146))),
                        child: Center(
                          child: Text(
                            'Accept',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xff059146),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: -40,
            top: 8,
            child: Container(
              height: 79,
              width: 79,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://www.sciencemag.org/sites/default/files/styles/article_main_image_-_1280w__no_aspect_/public/dogs_1280p_0.jpg?itok=6jQzdNB8"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
