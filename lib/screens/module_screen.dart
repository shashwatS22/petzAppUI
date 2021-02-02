import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/screens/home_screen.dart';
import 'package:petzapp_ui/utils/app_icons.dart';
import 'package:petzapp_ui/widgets/module_screen_widgets/module_screen_list_item.dart';

class ModuleScreen extends StatefulWidget {
  @override
  _ModuleScreenState createState() => _ModuleScreenState();
}

class _ModuleScreenState extends State<ModuleScreen> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    List<String> titles = [
      'Sell an animal or pet',
      'Buy an animal or pet',
      'Talk to a vet',
      'Book a service',
      'Get something for my pet',
      'Learn about breeds'
    ];
    List<String> backgroundColors = [
      '#F3E3D1',
      '#D9EEFE',
      '#D6FEDB',
      '#FFE5EE',
      '#FFF4F3',
      '#D9CCFF'
    ];
    List<String> descriptions = [
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.'
    ];
    List<String> images = [
      'assets/module1.png',
      'assets/module2.png',
      'assets/module3.png',
      'assets/module4.png',
      'assets/module5.png',
      'assets/module6.png'
    ];
    List<String> borderColors = [];
    List<String> titleColors = [
      '#C1721A',
      '#2DADC7',
      '#0BA71F',
      '#266DA7',
      '#0099FF',
      '#4300FF'
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: mq.width * 0.6,
                  height: mq.height * 0.12,
                  padding: EdgeInsets.all(mq.width * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome !',
                        style: TextStyle(
                            color: HexColor('#333333'),
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'What are you looking for?',
                        style: TextStyle(
                            color: HexColor('#333333'),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: mq.width * 0.06,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ));
                    },
                    child: Container(
                      child: Icon(
                        AppIcons.group_32,
                        color: HexColor('#187C7C'),
                        size: 20,
                      ),
                    )),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  for (int i = 0; i < titles.length; i++)
                    Column(
                      children: [
                        ModuleListItem(
                          backgroundColor: backgroundColors[i],
                          description: descriptions[i],
                          image: images[i],
                          title: titles[i],
                          titleColor: titleColors[i],
                        ),
                        SizedBox(
                          height: mq.height * 0.02,
                        )
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
