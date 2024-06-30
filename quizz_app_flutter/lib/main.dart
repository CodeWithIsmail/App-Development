// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  int currentQues = 0;
  List<Icon> scoreboard = [];
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.'
  ];
  List<String> answers = ['false', 'true', 'true'];
  bool done = false;

  void end() {
    Fluttertoast.showToast(
        msg: "No more questions!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 20.0);
  }

  void CheckAns(String need) {
    if (done)
      end();
    else {
      setState(() {
        if (answers[currentQues] == need) {
          scoreboard.add(
            Icon(
              Icons.check,
              color: Colors.green,
              size: 30,
            ),
          );
        } else {
          scoreboard.add(
            Icon(
              Icons.close,
              color: Colors.red,
              size: 30,
            ),
          );
        }
        if (currentQues == 2) {
          done = true;
        } else
          currentQues++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Card(
            color: Colors.blue.shade200,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                // textAlign: TextAlign.center,
                questions[currentQues],
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Card(
            color: Colors.green,
            child: TextButton(
              onPressed: () => CheckAns('true'),
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
              onPressed: () => CheckAns('false'),
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
