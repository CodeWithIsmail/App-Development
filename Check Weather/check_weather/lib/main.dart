// ignore_for_file: prefer_const_constructors

import 'package:check_weather/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const myApiId = '5b3cb5401434baa03670218a1d64f675';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var lat;
  var lon;
  var des;
  var tem;
  var press;
  var coun;

  String locationMessage = 'Checking location...';

  void getLoc() async {
    GetLocation getLocation = GetLocation();
    await getLocation.initLocation();

    // print(getLocation.latitude);
    setState(() {
      lat = getLocation.latitude;
      lon = getLocation.longitude;
      // print(lat);
      locationMessage =
          'Current Position: \nLatitude: ${getLocation.latitude}, \nLongitude: ${getLocation.longitude}';
    });

     getDataFromNet();
  }

  void getDataFromNet() async {
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$myApiId'));

    print(response.statusCode);

    if (response.statusCode == 200) {
      String data = response.body;
      var Ddata = jsonDecode(data);
      setState(() {
        lat = Ddata['coord']['lat'];
        lon = Ddata['coord']['lon'];
        des = Ddata['weather'][0]['description'];
        tem = Ddata['main']['temp'];
        press = Ddata['main']['pressure'];
        coun = Ddata['sys']['country'];
      });
      print(coun);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getLoc();
  }

  @override
  Widget build(BuildContext context) {
    // getDataFromNet();
    return MaterialApp(
      // theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text('Check Weather'),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(
                  child: Text(
                    'Latitude: $lat',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(
                  child: Text(
                    'Longitude: $lon',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(
                  child: Text(
                    'Country: $coun',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(
                  child: Text(
                    'Temperature: $tem',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(
                  child: Text(
                    'Pressure: $press',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(
                  child: Text(
                    'Description: $des',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // Center(
        //   child: Text(
        //     locationMessage,
        //     textAlign: TextAlign.center,
        //   ),
        // ),
      ),
    );
  }
}
