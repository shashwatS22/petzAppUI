import 'package:flutter/material.dart';
import 'package:petzapp_ui/widgets/bottom_navigation_bar_widgets/custom_bar.dart';
import 'package:petzapp_ui/widgets/login_screen_widgets/bottom_container.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: mq.height * 0.435,
                width: mq.width * 0.6,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/intro1.png"))),
              ),
              Container(
                width: mq.width,
                //height: mq.height,
                padding: EdgeInsets.all(mq.width * 0.02),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(mq.width * 0.15),
                      topRight: Radius.circular(mq.width * 0.15)),
                ),
                child: BottomContainer(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
