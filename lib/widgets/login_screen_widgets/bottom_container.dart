import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/screens/home_screen.dart';
import 'package:petzapp_ui/screens/verify_mobile_number_screen.dart';

class BottomContainer extends StatefulWidget {
  @override
  _BottomContainerState createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      height: 447,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text('Hello!',
                  style: GoogleFonts.poppins(
                      fontSize: 32,
                      color: HexColor('#333333'),
                      fontWeight: FontWeight.w600)),
              Text('Sign in to your account',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: HexColor('#333333'),
                      fontWeight: FontWeight.w300)),
            ],
          ),
          SizedBox(height: 28),
          Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 338,
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      //width: mq.width * 0.7,
                      //height: mq.height * 0.058,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17)),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.mobile_off_outlined,
                            size: 12,
                            color: HexColor('#1A7D7D'),
                          ),
                          fillColor: Colors.white,
                          hintText: "Enter your mobile number",
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: HexColor('#999999'),
                              fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: HexColor('#D6D6D6')),
                              borderRadius: BorderRadius.circular(17)),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return VerifyNumberScreen();
                                },
                              ));
                            },
                            child: Container(
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                                height: 50,
                                width: 57,
                                decoration: BoxDecoration(
                                  color: HexColor('#1A7D7D'),
                                  borderRadius: BorderRadius.circular(17),
                                ))))
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 14),
          Text(
            "OR",
            style: GoogleFonts.poppins(
                fontSize: 14,
                color: HexColor('#666666'),
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 14),
          Container(
              height: 50,
              //width: mq.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 160 / 50,
                    child: Container(
                      // width: mq.width * 0.23,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: HexColor('#D6D6D6')),
                        borderRadius: BorderRadius.circular(mq.width * 0.04),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: mq.height * 0.044,
                            width: mq.height * 0.037,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/google_logo.png'))),
                          ),
                          Text(
                            "Google",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: HexColor('#333333'),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: mq.width * 0.001,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  AspectRatio(
                    aspectRatio: 160 / 50,
                    child: Container(
                      //width: mq.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: HexColor('#D6D6D6')),
                        borderRadius: BorderRadius.circular(mq.width * 0.04),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: mq.height * 0.044,
                            width: mq.height * 0.04,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/facebook_logo.png'))),
                          ),
                          Text(
                            "Facebook",
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: HexColor('#333333'),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: mq.width * 0.001,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
          SizedBox(height: 93),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
              },
              child: Container(
                padding: EdgeInsets.only(right: mq.width * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: mq.width * 0.08,
                    ),
                    Text("Go to homepage",
                        style: GoogleFonts.poppins(
                            color: HexColor('#999999'),
                            fontSize: 14,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500)),
                    Icon(
                      Icons.arrow_forward,
                      color: HexColor('#999999'),
                      size: 18,
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
