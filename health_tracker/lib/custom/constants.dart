// ignore_for_file: prefer_const_declarations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_tracker/all.dart';

const KAppBarTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.5,
  color: Colors.black,
);

const KHomeIconText = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

const KWelcomeText = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontFamily: 'Newfont',
);

const KNameText = TextStyle(
  fontFamily: 'Playwrite',
  fontSize: 37,
  fontWeight: FontWeight.bold,
  color: Colors.purple,
);

const InputTextStyle = TextStyle(
  color: Colors.black,
);
const KWelcomePageText = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  // color: Colors.purple,
);

const GradientMain = LinearGradient(
  colors: [
    Color(0xFF7F7FD5),
    Color(0xFF86A8E7),
    Color(0xFF91EAE4),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

class PageName {
  static final welcome = 'welcome';
  static final log = 'log';
  static final regi = 'regi';
  static final home = 'home';
  static final profile = 'profile';
  static final record = 'record';
  static final blood = 'blood';
  static final consult = 'consult';
  static final about = 'about';
}

const logText = Text('Log In');
const regiText = Text('Register');



