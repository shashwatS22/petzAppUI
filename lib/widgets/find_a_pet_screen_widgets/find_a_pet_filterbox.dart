import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petzapp_ui/sample_data/sample_data.dart';

class FindAPetFilterScreen extends StatefulWidget {
  @override
  _FindAPetFilterScreenState createState() => _FindAPetFilterScreenState();
}

class _FindAPetFilterScreenState extends State<FindAPetFilterScreen> {
  String selectedGender;
  String selectedAge;
  String selectedMoreOptions;
  String sortBy;

  @override
  void initState() {
    selectedGender = SampleData.genderFilter[0];
    selectedAge = SampleData.ageFilter[0];
    selectedMoreOptions = SampleData.moreOptionsFilter[0];
    sortBy = "Latest";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      height: 1000,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.topCenter,
          colors: [
            Color(0xff187C7C).withOpacity(0.3),
            Color.fromARGB(0, 255, 255, 255)
          ],
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 50, left: 15, right: 15, top: 10),
        child: Container(
          height: 0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Filter",
                    style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 16,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Gender",
                    style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 14,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 40,
                    child: ListView.builder(
                        itemCount: SampleData.genderFilter.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGender =
                                      SampleData.genderFilter[index];
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: selectedGender ==
                                            SampleData.genderFilter[index]
                                        ? Theme.of(context).buttonColor
                                        : Color(0xffE7E7E7),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      SampleData.genderFilter[index],
                                      style: TextStyle(
                                          color: selectedGender ==
                                                  SampleData.genderFilter[index]
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 13,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Age",
                    style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 14,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 40,
                    child: ListView.builder(
                        itemCount: SampleData.ageFilter.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedAge = SampleData.ageFilter[index];
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: selectedAge ==
                                            SampleData.ageFilter[index]
                                        ? Theme.of(context).buttonColor
                                        : Color(0xffE7E7E7),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      SampleData.ageFilter[index],
                                      style: TextStyle(
                                          color: selectedAge ==
                                                  SampleData.ageFilter[index]
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 13,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "More Options",
                    style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 14,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 40,
                    child: ListView.builder(
                        itemCount: SampleData.moreOptionsFilter.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedMoreOptions =
                                      SampleData.moreOptionsFilter[index];
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: selectedMoreOptions ==
                                          SampleData.moreOptionsFilter[index]
                                      ? Theme.of(context).buttonColor
                                      : Color(0xffE7E7E7),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    SampleData.moreOptionsFilter[index],
                                    style: TextStyle(
                                      color: selectedMoreOptions ==
                                              SampleData
                                                  .moreOptionsFilter[index]
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 12,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Sort by",
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 16,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            sortBy = "Latest";
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: sortBy == "Latest"
                                ? Theme.of(context).buttonColor
                                : Colors.white,
                            border: Border.all(
                              color: Color(0xff333333),
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 6),
                            child: Text(
                              "Latest",
                              style: TextStyle(
                                color: sortBy == "Latest"
                                    ? Colors.white
                                    : Color(0xff333333),
                                fontSize: 12,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            sortBy = "Price";
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: sortBy == "Price"
                                ? Theme.of(context).buttonColor
                                : Colors.white,
                            border: Border.all(color: Color(0xff333333)),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Price  ",
                                  style: TextStyle(
                                    color: sortBy == "Price"
                                        ? Colors.white
                                        : Color(0xff333333),
                                    fontSize: 12,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_upward_sharp,
                                  size: 16,
                                  color: sortBy == "Price"
                                      ? Colors.white
                                      : Colors.black26,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Cancel",
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 14,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).buttonColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 35,
                            vertical: 10,
                          ),
                          child: Text(
                            "Search",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
