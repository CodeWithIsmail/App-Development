import 'package:flutter/material.dart';
import 'constants.dart';

class HomePageIcon extends StatelessWidget {
  VoidCallback function;
  String assetName;
  String data;

  HomePageIcon(this.function, this.assetName, this.data);

  // const HomePageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: function,
        child: Card(
          color: Colors.lightGreenAccent.shade100,
          margin: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                // color: Colors.purple.shade900,
                assetName,
                width: 100,
                height: 100,
              ),
              Text(
                textAlign: TextAlign.center,
                data,
                style: KHomeIconText,
              )
            ],
          ),
        ),
      ),
    );
  }
}
