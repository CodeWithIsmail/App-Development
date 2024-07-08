import 'package:flutter/material.dart';
import 'package:check_weather/services/location.dart';
import 'package:check_weather/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:check_weather/screens/loading_screen.dart';

import 'location_screen.dart';

const myApiId = '5b3cb5401434baa03670218a1d64f675';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    super.initState();
    getLoc();
  }

  void getLoc() async {
    GetLocation getLocation = GetLocation();
    await getLocation.initLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${getLocation.latitude}&lon=${getLocation.longitude}&appid=$myApiId&units=metric');

    var Ddata = await networkHelper.getDataFromNet();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LocationScreen(Ddata),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
