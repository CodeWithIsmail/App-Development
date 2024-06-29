// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Ball());
}

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int imgNo = 1;

  void func() {
    setState(() {
      imgNo = Random().nextInt(4) + 2;
    });
    print('image no $imgNo\n');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade400,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text(
            'Ask Me Anything',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextButton(
                onPressed: func,
                child: Image.asset('images/ball$imgNo.png'),
              ),
            ),
            Text(
              'Developed by CodeWithIsmail',
              style: TextStyle(
                  fontSize: 18, fontFamily: 'fonts/PressStart2P-Regular.ttf'),
            ),
          ],
        ),
      ),
    );
  }
}
