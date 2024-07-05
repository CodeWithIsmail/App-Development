// ignore_for_file: prefer_const_constructors

import 'package:check_weather/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double latitude=0.0,longitue=0.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Check Weather',
            style: KAppBarTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () async {
                Position position = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high);

                print(position);

                setState(() {
                  latitude=position.latitude;
                  longitue=position.longitude;
                });
              },
              child: Text('GET LOCATION',style: KAppBarTextStyle,),
            ),
            Text(
              textAlign: TextAlign.center,
              'Laitude: $latitude',
              style: KAppBarTextStyle,
            ),
            Text(
              textAlign: TextAlign.center,
              'Longitude: $longitue',
              style: KAppBarTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
