import 'package:flutter/material.dart';
import 'constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color bgcolor;
  final Color fgcolor;
  final String text;
  final VoidCallback function;

  CustomElevatedButton(this.bgcolor, this.fgcolor, this.text, this.function);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: bgcolor,
        foregroundColor: fgcolor,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        textStyle: KWelcomePageText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed:function,
      child: Text(text),
    );
  }
}