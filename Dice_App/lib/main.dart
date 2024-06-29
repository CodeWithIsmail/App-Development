// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(DicePage()); // DicePage()
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState(); // _DicePageState()
}

class _DicePageState extends State<DicePage> {
  int leftBtn = 1, rightBtn = 1;

  // void clickLeft() {
  //   setState(() {
  //     leftBtn = Random().nextInt(6) + 1;
  //   });
  //   // print('left button clicked');
  // }
  //
  // void clickRight() {
  //   setState(() {
  //     rightBtn = Random().nextInt(6) + 1;
  //   });
  //   print('right button clicked');
  // }

  void changeBtn() {
    setState(() {
      leftBtn = Random().nextInt(6) + 1;
      rightBtn = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xD0690DAE),
        appBar: AppBar(
          title: Text(
            'Dicee',
            style: TextStyle(
                fontSize: 20,
                letterSpacing: 2,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ), // TextStyle
          backgroundColor: Color(0xD0B37FE2),
        ), // AppBar
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: changeBtn,
                  child: Image.asset('images/dice$leftBtn.png'),
                ), // TextButton
              ), // Expanded
              Expanded(
                child: TextButton(
                  onPressed: changeBtn,
                  child: Image.asset('images/dice$rightBtn.png'),
                ), // TextButton
              ), // Expanded
            ],
          ), // Row
        ), // Center
      ), // Scaffold
    ); // MaterialApp
  }
}
