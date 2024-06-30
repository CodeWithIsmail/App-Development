// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0x3AD6E4D8),
        appBar: AppBar(
          backgroundColor: Color(0xFF412653),
          title: Text(
            'Quiz App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              // fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreboard = [];

  void checkAns() {
    setState(() {
      scoreboard.add(
        Icon(
          Icons.close,
          color: Colors.red,
          size: 30,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisAlignment: ,
      children: [
        Expanded(
          flex: 5,
          child: Card(
            color: Colors.blue,
            child: Text(
              'This is where the question text will go.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Card(
            color: Colors.green,
            child: TextButton(
              onPressed: checkAns,
              child: Text(
                'TRUE',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Card(
            color: Colors.red,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'FALSE',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            color: Color(0xffe0e7e1),
            child: Row(
              children: scoreboard,
            ),
          ),
        )
      ],
    );
  }
}
