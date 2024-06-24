import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          centerTitle: true,
          title: Text('I am rich'),
          backgroundColor: Colors.tealAccent,
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/ruby.jpg'),
          ),
        ),
      ),
    ),
  );
}
