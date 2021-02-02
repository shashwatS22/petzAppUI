import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:petzapp_ui/models/core_models.dart';

class MyOtherPetListItem extends StatelessWidget {
  final int index;
  final Pet pet;
  MyOtherPetListItem({this.index, this.pet});

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(mq.width * 0.004),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (index == 0)
            Center(
              child: Container(
                decoration: DottedDecoration(
                    shape: Shape.box,
                    color: Colors.green[300],
                    strokeWidth: 2.5),
                child: Container(
                  margin: EdgeInsets.all(mq.width * 0.008),
                  height: mq.height * 0.14,
                  width: mq.height * 0.14,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(pet.media[0].file),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
          if (index != 0)
            Container(
              margin: EdgeInsets.all(mq.width * 0.01),
              height: mq.height * 0.14,
              width: mq.height * 0.14,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(pet.media[0].file),
                    fit: BoxFit.cover,
                  )),
            ),
        ],
      ),
    );
  }
}
