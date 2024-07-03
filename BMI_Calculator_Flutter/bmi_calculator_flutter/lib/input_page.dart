// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'GenderSelectWidget.dart';
import 'Reusable_Container.dart';

const lastCardColor = Colors.pinkAccent;
const allCardColor = Color(0xFF1D1E33);
const inactivecolor = Color(0xFF111328);

enum GenderType { male, female,nothing }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = inactivecolor;
  Color femaleColor = inactivecolor;
   GenderType selectedGender=GenderType.nothing;

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
                          ? allCardColor
                          : inactivecolor,
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
                          ? allCardColor
                          : inactivecolor,
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
              color: allCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusable_Container(
                    color: allCardColor,
                  ),
                ),
                Expanded(
                  child: Reusable_Container(
                    color: allCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: lastCardColor,
            height: 75.0,
            margin: EdgeInsets.only(top: 10),
          ),
        ],
      ),
    );
  }
}
