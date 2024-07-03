// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'GenderSelectWidget.dart';
import 'Reusable_Container.dart';
import 'constants.dart';

enum GenderType { male, female, nothing }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = KInactivecolor;
  Color femaleColor = KInactivecolor;
  GenderType selectedGender = GenderType.nothing;

  int feetH = 2, inchH = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                      // updateSelectedGenderColor(GenderType.male);
                    },
                    child: Reusable_Container(
                      color: selectedGender == GenderType.male
                          ? KLllCardColor
                          : KInactivecolor,
                      childWidget:
                          GenderSelectWidget(FontAwesomeIcons.mars, 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                      // updateSelectedGenderColor(GenderType.male);
                    },
                    child: Reusable_Container(
                      color: selectedGender == GenderType.female
                          ? KLllCardColor
                          : KInactivecolor,
                      childWidget:
                          GenderSelectWidget(FontAwesomeIcons.venus, 'FEMALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusable_Container(
              color: KLllCardColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: KIconTextStyle,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  feetH.toString(),
                                  style: KValueTextStyle,
                                ),
                                Text(
                                  'Feet',
                                  style: KIconTextStyle,
                                )
                              ],
                            ),
                            Slider(
                              value: feetH.toDouble(),
                              onChanged: (double currentFeet) {
                                setState(() {
                                  feetH = currentFeet.round();
                                });
                              },
                              activeColor: Colors.pinkAccent,
                              inactiveColor: Colors.grey.shade600,
                              min: 0,
                              max: 9,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  inchH.toString(),
                                  style: KValueTextStyle,
                                ),
                                Text(
                                  'Inch',
                                  style: KIconTextStyle,
                                )
                              ],
                            ),
                            Slider(
                              value: inchH.toDouble(),
                              onChanged: (double currentInch) {
                                setState(() {
                                  inchH = currentInch.round();
                                });
                              },
                              activeColor: Colors.pinkAccent,
                              inactiveColor: Colors.grey.shade600,
                              min: 2,
                              max: 11,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusable_Container(
                    color: KLllCardColor,
                  ),
                ),
                Expanded(
                  child: Reusable_Container(
                    color: KLllCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: KLastCardColor,
            height: 75.0,
            margin: EdgeInsets.only(top: 10),
          ),
        ],
      ),
    );
  }
}
