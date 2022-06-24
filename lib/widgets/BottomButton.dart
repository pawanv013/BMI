import 'package:bmi_calculator/constants/Constant.dart';
import 'package:bmi_calculator/model/CardModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle});
  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Consumer<CardModel>(
      builder: (context, btnProv, child) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            child: Center(
              child: Text(buttonTitle, style: kLargeButtonTextStyle),
            ),
            color: btnProv.buttonColor,
            width: double.infinity,
            height: btnProv.buttonHight,
          ),
        );
      },
    );
  }
}
