import 'package:flutter/material.dart';

class FoodCategoryList extends StatefulWidget {
  @override
  _FoodCategoryListState createState() => _FoodCategoryListState();
}

class _FoodCategoryListState extends State<FoodCategoryList> {
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    //print(widget.breedList);
    return Container(
      height: mq.height * 0.16,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.06),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Food Category",
                style: TextStyle(fontSize: 17, color: Color(0xff000000)),
              ),
            ),
          ),
          SizedBox(height: mq.height * 0.016),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: mq.width * 0.06),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    FoodCategoryItem(),
                    SizedBox(
                      width: mq.width * 0.02,
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class FoodCategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
      child: Container(
        // height: mq.height * 0.1,
        width: mq.width * 0.32,
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.all(10),

        child: Text(
          'Dog Food',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w300, color: Colors.white),
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          // image:
          //     DecorationImage(
          //       image: AssetImage(),
          //      fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              color: Color(0xffD6D6D6),
              blurRadius: 0.4, // soften the shadow
              spreadRadius: 0.4, //extend the shadow
            ),
          ],
          border: Border.all(color: Color(0xffD6D6D6), width: 1.2),
          borderRadius: BorderRadius.all(
            Radius.circular(mq.height * 0.012),
          ),
        ),
      ),
    );
  }
}
