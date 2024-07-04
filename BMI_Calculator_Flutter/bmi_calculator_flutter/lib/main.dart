// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator_flutter/result_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'result_page.dart';

// void main() => runApp(BMICalculator());
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/Result',
      // routes: {
      //   '/': (context) => InputPage(),
      //   '/Result': (context) => ResultPage(),
      // },
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}
