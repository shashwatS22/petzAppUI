import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CompleteProfileScreen extends StatefulWidget {
  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  bool checkedValue = true;
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(mq.height * 0.08),
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
                "Complete your profile",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Color(0xff333333),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: mq.height * 0.3,
                          width: mq.width * 0.6,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/intro1.png"))),
                        ),
                        Container(
                          width: mq.width * 0.8,
                          height: mq.height * 0.06,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: mq.width * 0.3,
                                height: mq.height * 0.04,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.ac_unit,
                                      size: 18,
                                      color: Color(0xff187C7C),
                                    ),
                                    Text(
                                      'Male',
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 1,
                                          spreadRadius: 1,
                                          color: Color(0xffE7E7E7))
                                    ],
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(mq.width * 0.04),
                                    border: Border.all(
                                        color: Color(0xff187C7C), width: 2)),
                              ),
                              Container(
                                width: mq.width * 0.3,
                                height: mq.height * 0.04,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.ac_unit,
                                      size: 18,
                                      color: Color(0xffA7D7D4D),
                                    ),
                                    Text(
                                      'Female',
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 1,
                                          spreadRadius: 1,
                                          color: Color(0xffE7E7E7))
                                    ],
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(mq.width * 0.04),
                                    border: Border.all(
                                        color: Color(0xffE7E7E7), width: 2)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: mq.height * 0.02),
                        Container(
                          width: mq.width * 0.7,
                          child: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Full Name',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff666666))),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintStyle:
                                          TextStyle(color: Color(0xffD5D5D5)),
                                      hintText: "Enter your name"),
                                ),
                                SizedBox(
                                  height: mq.height * 0.02,
                                ),
                                Text('Mobile Number',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff666666))),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintStyle:
                                          TextStyle(color: Color(0xffD5D5D5)),
                                      hintText: "Enter your mobile number"),
                                ),
                                SizedBox(
                                  height: mq.height * 0.02,
                                ),
                                Text('Email Address',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff666666))),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintStyle:
                                          TextStyle(color: Color(0xffD5D5D5)),
                                      hintText: "Enter your addresss"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: mq.width * 0.06),
                          child: CheckboxListTile(
                            checkColor: Color(0xff1A7D7D),
                            activeColor: Colors.white,

                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Agree to our ",
                                  style: TextStyle(
                                      color: Color(0xff999999), fontSize: 12),
                                ),
                                Text(
                                  "Terms & conditions",
                                  style: TextStyle(
                                      color: Color(0xff1A7D7D), fontSize: 12),
                                )
                              ],
                            ),
                            value: checkedValue,
                            onChanged: (check) {
                              setState(() {
                                checkedValue = check;
                              });
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                        ),
                        Container(
                          height: mq.height * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: mq.height * 0.05,
                                width: mq.height * 0.05,
                                child: Center(
                                    child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xff1A7D7D),
                                          blurRadius: 1,
                                          spreadRadius: 1)
                                    ],
                                    shape: BoxShape.circle,
                                    color: Color(0xff1A7D7D)),
                              ),
                              SizedBox(
                                width: mq.width * 0.06,
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}
