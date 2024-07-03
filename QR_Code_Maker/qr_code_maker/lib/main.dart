// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:qr_flutter/qr_flutter.dart';

String text = '';

void main() {
  runApp(QRmaker());
}

class QRmaker extends StatefulWidget {
  const QRmaker({super.key});

  @override
  State<QRmaker> createState() => _QRmakerState();
}

class _QRmakerState extends State<QRmaker> {
  @override
  final TextEditingController _controller = TextEditingController();

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
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.all(25),
              child: TextField(
                minLines: 5,
                maxLines: 6,
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter your text here',
                  hintStyle: TextStyle(
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white),
              ),
              onPressed: () {
                setState(() {
                  text = _controller.text;
                });
              },
              child: Text(
                'SUBMIT',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              flex: 3,
              child: QrImageView(
                data: text,
                version: QrVersions.auto,
                size: 300.0,
                errorCorrectionLevel: QrErrorCorrectLevel.H,
                backgroundColor: Colors.white,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Developed by CodeWithIsmail',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
