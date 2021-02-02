import 'package:flutter/material.dart';
import 'package:petzapp_ui/models/core_models.dart';
import './breed_guide_rounded_slider_item.dart';

class RoundedBreedSlider extends StatefulWidget {
  final List<AnimalCategory> animalCategories;
  RoundedBreedSlider({this.animalCategories});
  @override
  _RoundedBreedSliderState createState() => _RoundedBreedSliderState();
}

class _RoundedBreedSliderState extends State<RoundedBreedSlider> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    //print(widget.breedList);
    return Container(
      height: mq.height * 0.147,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
              scrollDirection: Axis.horizontal,
              itemCount: widget.animalCategories.length,
              itemBuilder: (context, index) {
                return RoundedBreedSliderItem(
                    genus: widget.animalCategories[index].genus, index: index);
              },
            ),
          )
        ],
      ),
    );
  }
}
