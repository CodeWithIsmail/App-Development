// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants.dart';
import 'package:health_tracker/HomePageIcon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(

          'HealthTracker',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
            icon: SvgPicture.asset(
              'icons/info.svg',
              width: 23,
              height: 23,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Card(
              color: Colors.lightGreenAccent.shade100,
              margin: EdgeInsets.all(15),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WELCOME',
                    textAlign: TextAlign.center,
                    style: KWelcomeText,
                  ),
                  Text(
                    'Ismail Hossain',
                    style: KNameText,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                HomePageIcon(() {
                  Navigator.pushNamed(context, '/profile');
                }, 'images/profile.png', 'Profile'),
                HomePageIcon(() {
                  Navigator.pushNamed(context, '/record');
                }, 'images/record.png', 'Health Record'),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                HomePageIcon(() {
                  Navigator.pushNamed(context, '/blood');
                }, 'images/blood.png', 'Blood Bank'),
                HomePageIcon(() {
                  Navigator.pushNamed(context, '/consult');
                }, 'images/consulting.png', 'Doctor Consulation'),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
