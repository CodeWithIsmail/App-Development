// ignore_for_file: prefer_const_constructors
import 'package:check_weather/services/weather.dart';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:check_weather/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  late final locationWeather;

  LocationScreen(this.locationWeather);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  late double temp;
  late int tempint;
  var cond;
  var city;
  var weatherIcon;
  var weather;

  @override
  void initState() {
    print(widget.locationWeather);
    // print(widget.locationWeather);
    updateUI(widget.locationWeather);
    // TODO: implement initState
    super.initState();
  }

  void updateUI(dynamic locationWeather) {
    setState(() {
      cond = locationWeather['weather'][0]['id'];
      temp = locationWeather['main']['temp'];
      tempint = temp.toInt();
      weatherIcon = weatherModel.getWeatherIcon(tempint);
      weather = weatherModel.getMessage(tempint);
      // city = locationWeather['name'];
      city = locationWeather['sys']['country'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$tempint°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weather in $city!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
