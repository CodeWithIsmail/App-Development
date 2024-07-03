import 'package:flutter/material.dart';

class Reusable_Container extends StatelessWidget {
  Color color;
  Widget? childWidget;

  Reusable_Container({required this.color, this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
