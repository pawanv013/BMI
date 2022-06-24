import 'package:bmi_calculator/constants/Constant.dart';
import 'package:bmi_calculator/model/CardModel.dart';
import 'package:bmi_calculator/widgets/BottomButton.dart';
import 'package:bmi_calculator/widgets/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final double bmi;
  final String interpretation;
  ResultPage(
      {required this.result, required this.bmi, required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CardModel())],
      child: Scaffold(
        appBar: AppBar(title: Text('BMI CALCULATOR')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text('Your Result', style: kTitleTextStyle),
              ),
            ),
            Expanded(
              flex: 3,
              child: ReusableCard(
                  containerColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(this.result, style: kResultTextStyle),
                      Text(this.bmi.toStringAsFixed(1), style: kBMITextStyle),
                      Text(this.interpretation,
                          textAlign: TextAlign.center, style: kBodyTextStyle),
                    ],
                  )),
            ),
            Consumer<CardModel>(
              builder: (context, btnProv, child) {
                return BottomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonTitle: 'RE-CALCULATE',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
