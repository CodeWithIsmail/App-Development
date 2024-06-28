// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0x5CDDB8FF),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/118668314?v=4'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Ismail Hossain',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Playwrite',
                  // fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Newfont',
                  fontSize: 18,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.blue.shade900,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'bsse1433@iit.du.ac.bd',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 25,
                      color: Colors.blue.shade900,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '015xxxxxx99',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 25,
                      color: Colors.blue.shade900,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'CodeWithIsmail',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 25,
                    color: Colors.blue.shade900,
                  ),
                  title: Text(
                    'ismail360',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
