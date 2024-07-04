// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'GenderSelectWidget.dart';
import 'Reusable_Container.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bmi_info.dart';
enum GenderType { male, female, nothing }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = KInactivecolor;
  Color femaleColor = KInactivecolor;
  GenderType selectedGender = GenderType.nothing;

  int feetH = 2, inchH = 2, weight = 50, age = 20;

  void increaseWt() {
    setState(() {
      weight++;
    });
  }

  void decreaseWt() {
    setState(() {
      weight--;
    });
  }

  void increaseAge() {
    setState(() {
      age++;
    });
  }

  void decreaseAge() {
    setState(() {
      age--;
    });
  }

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
                          ? KAllCardColor
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
                          ? KAllCardColor
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
              color: KAllCardColor,
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
                    color: KAllCardColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: KIconTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KValueTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingIconButton(
                              FontAwesomeIcons.minus,
                              decreaseWt,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingIconButton(
                              FontAwesomeIcons.plus,
                              increaseWt,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable_Container(
                    color: KAllCardColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: KIconTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KValueTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingIconButton(
                              FontAwesomeIcons.minus,
                              decreaseAge,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingIconButton(
                              FontAwesomeIcons.plus,
                              increaseAge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BMI_info bmi_find=BMI_info(feetH, inchH, weight);
              bmi_find.getResult();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultPage(bmi_find)),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE BMI',
                  style: KSubmitText,
                ),
              ),
              width: double.infinity,
              color: KLastCardColor,
              height: 75.0,
              margin: EdgeInsets.only(top: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class FloatingIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPress;

  FloatingIconButton(this.iconData, this.onPress);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      onPressed: onPress,
      fillColor: floatButtonColor,
      shape: CircleBorder(),
      child: Icon(
        iconData,
      ),
    );
  }
}
