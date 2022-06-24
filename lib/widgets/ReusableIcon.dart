import 'package:bmi_calculator/constants/Constant.dart';
import 'package:flutter/material.dart';

class ReusableIcon extends StatelessWidget {
  ReusableIcon(
      {required this.cardIcon, required this.iconSize, required this.iconText});
  final IconData cardIcon;
  final double iconSize;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: iconSize,
        ),
        SizedBox(height: 15.0),
        Text(
          iconText,
          style: ktextStyle,
        )
      ],
    );
  }
}
