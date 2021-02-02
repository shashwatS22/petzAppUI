import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/models/core_models.dart';
import 'package:petzapp_ui/widgets/breed_guide_screen_widgets/breed_detail.dart';

class PopularBreedListItem extends StatelessWidget {
  final Breed breed;
  PopularBreedListItem({this.breed});
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(6),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffD6D6D6),
                    blurRadius: 5, // soften the shadow
                    spreadRadius: 5, //extend the shadow
                  ),
                ],
                // border: Border.all(color: Color(0xffD6D6D6), width: 1.2),
              ),
              height: mq.height * 0.3,
              width: mq.width * 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://www.sciencemag.org/sites/default/files/styles/article_main_image_-_1280w__no_aspect_/public/dogs_1280p_0.jpg?itok=6jQzdNB8",
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 5,
                        child: Text(breed.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xffFFFFFF))),
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                          width: mq.width * 0.05,
                          height: mq.height * 0.05,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/india_flag.jpg')),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return BreedDetail(
                          breed: breed,
                        );
                      },
                    ));
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
