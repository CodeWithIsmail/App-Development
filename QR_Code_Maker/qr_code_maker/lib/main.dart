// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown.shade900,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'QR Maker',
            style: kAppBarTextStyle,
          ),
          backgroundColor: Colors.brown.shade700,
        ),
        body: QrImageView(
          data: 'Name: Ismail Hossain'
              ' Blood group: B+'
              '  BMI: 21.10\n',
          version: QrVersions.auto,
          size: 200.0,
          errorCorrectionLevel: QrErrorCorrectLevel.H,
          backgroundColor: Colors.white,
          embeddedImage: AssetImage(
            'images/img.jpg',
          ),
          embeddedImageStyle: QrEmbeddedImageStyle(size: Size(35, 35)),
        ),
      ),
    );
  }
}
