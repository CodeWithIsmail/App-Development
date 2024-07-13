// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'constants.dart';

InputDecoration CustomInputDecoration(String textHint)
{
  return InputDecoration(
    hintText: textHint,
    hintStyle: InputTextStyle,
    contentPadding:
    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: Colors.purple.shade900, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: Colors.purple.shade900, width: 2.5),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
}