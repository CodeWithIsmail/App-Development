// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bmi_calculator_flutter/Reusable_Container.dart';
import 'package:bmi_calculator_flutter/bmi_info.dart';
import 'package:bmi_calculator_flutter/input_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'Reusable_Container.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {

  BMI_info bmi_info;


  ResultPage(this.bmi_info);

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15),
              child: Text(
                'Your Result',
                style: KHeadingText,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusable_Container(
              color: KAllCardColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                   bmi_info.result,
                    style: KResultText,
                  ),
                  Text(
                    bmi_info.bmi.toStringAsFixed(2),
                    style: KBmiText,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    bmi_info.advice,
                    style: KSuggesText,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              // padding: EdgeInsets.only(bottom: 10),
              child: Center(
                child: Text(
                  'RE-CALCULATE',
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
