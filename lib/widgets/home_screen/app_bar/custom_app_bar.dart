import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/sample_data/sample_data.dart';
import 'package:petzapp_ui/screens/login_screen.dart';
import 'package:petzapp_ui/utils/app_icons.dart';

class CustomAppBar extends StatelessWidget {
  void toggle() {
    innerDrawerKey.currentState.toggle(
        // direction is optional
        // if not set, the last direction will be used
        //InnerDrawerDirection.start OR InnerDrawerDirection.end
        direction: InnerDrawerDirection.start);
  }

  final GlobalKey<InnerDrawerState> innerDrawerKey;
  CustomAppBar({this.innerDrawerKey});
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      height: mq.height * 0.12,
      child: Row(
        children: [
          SizedBox(
            width: mq.width * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(top: mq.height * 0.04),
            child: IconButton(
              icon: Icon(
                Icons.format_line_spacing,
                color: Colors.grey,
                size: 28,
              ),
              onPressed: () {
                toggle();
              },
            ),
          ),
          SizedBox(
            width: mq.width * 0.20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Hi, ${SampleData.user.name}",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    AppIcons.path_46,
                    color: Color.fromARGB(255, 80, 171, 164),
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Bangalore",
                    style: GoogleFonts.poppins(
                        fontSize: 14, color: HexColor("#777777")),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            width: mq.width * 0.26,
          ),
          Padding(
              padding: EdgeInsets.only(top: mq.height * 0.04),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ));
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.sciencemag.org/sites/default/files/styles/article_main_image_-_1280w__no_aspect_/public/dogs_1280p_0.jpg?itok=6jQzdNB8"),
                ),
              ))
        ],
      ),
    );
    // AppBar(
    //   titleSpacing: 0,
    //   centerTitle: true,
    //   primary: true,
    //   title: Container(
    //     height: mq.height * 0.12,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         SizedBox(
    //           height: 30,
    //         ),
    //         Text(
    //           "Hi, John Smith",
    //           style: TextStyle(color: Colors.black54, fontSize: 15),
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             IconButton(
    //                 icon: Icon(
    //                   Icons.location_on,
    //                   color: Color.fromARGB(255, 80, 171, 164),
    //                   size: 30,
    //                 ),
    //                 onPressed: () {})
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    //   elevation: 0,
    //   backgroundColor: Colors.white,
    //   leading: IconButton(
    //     icon: Icon(
    //       Icons.format_line_spacing,
    //       color: Colors.grey,
    //       size: 30,
    //     ),
    //     onPressed: () {},
    //   ),
    // );
  }
}
