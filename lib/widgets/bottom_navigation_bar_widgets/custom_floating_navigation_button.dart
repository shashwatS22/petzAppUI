import 'package:flutter/material.dart';
import 'package:petzapp_ui/utils/app_icons.dart';
import './floating_action_button_screen.dart';

class CustomFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          barrierColor: Colors.black.withAlpha(1),
          context: context,
          builder: (context) => FloatingActionButtonScreen(),
        );
      },
      backgroundColor: Color.fromARGB(255, 80, 171, 164),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Icon(AppIcons.group_342__1_),
    );
  }
}
