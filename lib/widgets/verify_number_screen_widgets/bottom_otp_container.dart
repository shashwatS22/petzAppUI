import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/screens/home_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class BottomContainerOTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      //add margin
      margin: EdgeInsets.symmetric(horizontal: 38),
      height: 447,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 51),
              Text(
                'Verify Mobile Number',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: HexColor('#333333'),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 21),
          Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                // width: 338,
                decoration: BoxDecoration(
                    color: Color(0xFFDEDEDE),
                    borderRadius: BorderRadius.circular(17)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: mq.width * 0.02),
                        Icon(
                          Icons.mobile_off_outlined,
                          size: 15,
                          color: HexColor('#1A7D7D'),
                        ),
                        SizedBox(width: mq.width * 0.02),
                        Text(
                          "+91 92313 21312",
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: HexColor("#666666")),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_forward,
                          size: 15,
                          color: HexColor('#1A7D7D'),
                        ),
                        SizedBox(width: mq.width * 0.02),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 29,
          ),
          Container(
            // width: mq.width * 0.7,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Enter OTP",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.black,

                        /// fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Resend OTP",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: HexColor('#1A7D7D'),
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                SizedBox(height: 3.4),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  onChanged: (text) {},
                  cursorColor: Colors.black,
                  backgroundColor: Colors.grey[100],
                  obscureText: false,
                  obscuringCharacter: "-",
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    activeColor: HexColor('#D6D6D6'),
                    selectedFillColor: Colors.white,
                    inactiveColor: HexColor('#D6D6D6'),
                    inactiveFillColor: Colors.white,
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(5),
                    fieldWidth: mq.width * 0.15,
                    fieldHeight: mq.height * 0.05,
                    activeFillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 23.4),
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        child: Center(
                            child: Text("VERIFY",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: HexColor('#FFFFFF'),
                                    fontWeight: FontWeight.w300))),
                        height: mq.height * 0.06,
                        width: mq.width * 0.4,
                        decoration: BoxDecoration(
                          color: HexColor('#1A7D7D'),
                          borderRadius: BorderRadius.circular(mq.width * 0.04),
                        ))),
                SizedBox(
                  height: 55,
                ),
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
          ),
        ],
      ),
    );
  }
}
