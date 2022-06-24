import 'dart:ui';

import 'package:bmi_calculator/ResultPage.dart';
import 'package:bmi_calculator/constants/Constant.dart';
import 'package:bmi_calculator/model/CardModel.dart';
import 'package:bmi_calculator/widgets/RoundIconButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'widgets/BottomButton.dart';
import 'widgets/ReusableCard.dart';
import 'widgets/ReusableIcon.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => CardModel())],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Consumer<CardModel>(
                builder: (context, genderProv, child) {
                  return Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            genderProv.selectedGender = 'male';
                          },
                          child: ReusableCard(
                            containerColor: genderProv.genderSelected == 'male'
                                ? genderProv.cardColor
                                : genderProv.inActiveCardColor,
                            cardChild: ReusableIcon(
                              cardIcon: FontAwesomeIcons.mars,
                              iconSize: 80.0,
                              iconText: 'MALE',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            genderProv.selectedGender = 'female';
                          },
                          child: ReusableCard(
                              containerColor:
                                  genderProv.genderSelected == 'female'
                                      ? genderProv.cardColor
                                      : genderProv.inActiveCardColor,
                              cardChild: ReusableIcon(
                                  cardIcon: FontAwesomeIcons.venus,
                                  iconSize: 80.0,
                                  iconText: 'FEMALE')),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: Consumer<CardModel>(
                builder: (context, heightProv, child) {
                  return ReusableCard(
                    containerColor: heightProv.cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: ktextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              heightProv.height.toString(),
                              style: kHeightStyle,
                            ),
                            Text('cm'),
                          ],
                        ),
                        SliderTheme(
                          data: Theme.of(context).sliderTheme,
                          child: Slider(
                            min: 120,
                            max: 260,
                            value: heightProv.height.toDouble(),
                            onChanged: (val) {
                              heightProv.setHeight = val.round();
                            },
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Consumer<CardModel>(
                builder: (context, weightProv, child) {
                  return Row(
                    children: [
                      Expanded(
                        child: ReusableCard(
                          containerColor: weightProv.cardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('WEIGHT', style: ktextStyle),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(weightProv.weight.toString(),
                                      style: kHeightStyle),
                                  Text('kg')
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onTapp: () {
                                      weightProv.minusWeight();
                                    },
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onTapp: () {
                                      weightProv.plusWeight();
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          containerColor: weightProv.cardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('AGE', style: ktextStyle),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(weightProv.age.toString(),
                                      style: kHeightStyle),
                                  Text('year')
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onTapp: () {
                                      weightProv.minusAge();
                                    },
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onTapp: () {
                                      weightProv.plusAge();
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Consumer<CardModel>(
              builder: (context, btnProv, child) {
                return BottomButton(
                  onTap: () {
                    btnProv.calculateBMI();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(
                                result: btnProv.result,
                                bmi: btnProv.bmi,
                                interpretation: btnProv.interpretation)));
                  },
                  buttonTitle: 'CALCULATE',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
