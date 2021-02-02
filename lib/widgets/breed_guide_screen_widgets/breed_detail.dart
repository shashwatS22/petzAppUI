import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';

class BreedDetail extends StatefulWidget {
  final Breed breed;
  BreedDetail({this.breed});
  @override
  _BreedDetailState createState() => _BreedDetailState();
}

class _BreedDetailState extends State<BreedDetail> {
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
            "Breed Guide",
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
                  image: NetworkImage(
                      'https://www.sciencemag.org/sites/default/files/styles/article_main_image_-_1280w__no_aspect_/public/dogs_1280p_0.jpg?itok=6jQzdNB8'),
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
                              "Labrador Retriever",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Foreign Breeds",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0xff1A7D7D),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xff1A7D7D),
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.share_outlined,
                                  size: 20,
                                  color: Color(0xff1A7D7D),
                                ),
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
                      // padding: EdgeInsets.all(25),
                      physics: ClampingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      children: [],
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
