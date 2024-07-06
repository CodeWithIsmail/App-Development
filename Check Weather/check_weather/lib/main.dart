// ignore_for_file: prefer_const_constructors

import 'package:check_weather/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String locationMessage = 'Checking location...';

  void getLoc() async {
    GetLocation getLocation = GetLocation();
    await getLocation.initLocation();
    // print(getLocation.latitude);
    setState(() {
      locationMessage =
          'Current Position: \nLatitude: ${getLocation.latitude}, \nLongitude: ${getLocation.longitude}';
    });
  }

  @override
  void initState() {
    super.initState();
    getLoc();
  }

  void getDataFromNet()
  {
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Check Weather'),
        ),
        body: Center(
          child: Text(
            locationMessage,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
