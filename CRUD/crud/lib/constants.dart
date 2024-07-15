import 'dart:math';

import 'package:flutter/material.dart';

const gradientColor = LinearGradient(
  colors: [
    Color(0xFF355C7D),
    Color(0xFF6C5B7B),
    Color(0xFFC06C84),
  ],
);

const gradientBackGroundColor = LinearGradient(
  colors: [
    Color(0xFF74ebd5),
    Color(0xFFACB6E5),
  ],
  // transform: GradientRotation(pi / 2),
);

final boxShadow = BoxShadow(
  offset: Offset(5, 5),
  blurRadius: 5,
  color: Colors.grey.shade500,
);

const titleStyle = TextStyle(
  color: Colors.white,
);

const subtitleStyle = TextStyle(
  color: Colors.lightGreenAccent,
);


class PageName
{
  static final log='log';
  static final reg='reg';
  static final home='home';
}