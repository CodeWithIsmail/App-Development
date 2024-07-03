import 'package:flutter/material.dart';
import 'constants.dart';


class GenderSelectWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  GenderSelectWidget(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: KIconTextStyle,
        ),
      ],
    );
  }
}
