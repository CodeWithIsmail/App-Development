// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  void playSound(int n) {
    final player = AudioPlayer();
    player.play(AssetSource('note$n.wav'));
  }

  Expanded buildUi(int i) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue[i * 100 + 100],
        ),
        onPressed: () {
          playSound(i);
        },
        child: Text(
          'm',
          style: TextStyle(
            color: Colors.blue[i * 100 + 100],
          ),
        ),
      ),
    );
  }

  // for(int i=1;i<=7;i++) buildUi(i);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0x849D82E9),
          title: Text(
            'Xylophone',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
        backgroundColor: Color(0x845031B2),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (int i = 1; i <= 7; i++) buildUi(i),
            ],
          ),
        ),
      ),
    );
  }
}
